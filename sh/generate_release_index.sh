#!/bin/bash
function generate_release_index {
cd $RELEASE_DIR
cat > index.html <<'EOF'
  <html>
  <head>
    <title>Jamear2 Releases</title>
  </head>
  <body>
    <h1>Releases</h1>
EOF

for f in *; do
  cat >> index.html <<EOF
    <div>
    <a href="$f">
      $f
    </a>
    </div>
EOF
done

cat >> index.html <<'EOF'
  </body>
  </html>
EOF
cd -
}