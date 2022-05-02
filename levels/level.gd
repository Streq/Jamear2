extends Node2D

export var song : String = ""
export var ambience : String = ""
export var require_all_dead := false
export var require_stealth := false


func _ready():
	Music.play_music(song)
	Music.play_ambience(ambience)
