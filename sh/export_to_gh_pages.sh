#!/bin/bash
green=`tput setaf 2`
reset=`tput sgr0`
print_message(){
	echo "${green}$1${reset}"
}

print_message "stashing changes"
git add .
git stash || exit "$?"

if test -f ".gitignore"; then 
	GITIGNORE=true
else
	GITIGNORE=false
fi

CURRENT_VERSION=$(git describe --abbrev=0 --tags 2>/dev/null)
print_message "version $CURRENT_VERSION"

. generate_release_index.sh

git checkout gh-pages || git checkout -b gh-pages || exit "$?"

print_message "running git rm -rf on directory (to avoid merge conflicts)"
git rm -rf . || exit "$?"

if $GITIGNORE; then
	print_message "recovering .gitignore"
	git checkout main -- .gitignore || exit "$?"
fi

print_message "applying stash"
git stash pop || exit "$?"

print_message "creating release directory"
RELEASE_DIR=releases
[ ! -d $RELEASE_DIR ] && mkdir $RELEASE_DIR

DEST_DIR=$RELEASE_DIR/$CURRENT_VERSION
[ ! -d $DEST_DIR ] mkdir $DEST_DIR

print_message "copying latest export to corresponding release directory $DEST_DIR"
rsync -av --progress index* $DEST_DIR --exclude $RELEASE_DIR

print_message "generating release index"
generate_release_index

print_message "committing changes"
git add .
git commit -m"release"
git push || git push --set-upstream origin gh-pages || exit "$?"
git checkout main