extends YSort

export var song : String = ""
export var ambience : String = ""


func _ready():
	if song:
		Music.play_music(song)
	if ambience:
		Music.play_ambience(ambience)
