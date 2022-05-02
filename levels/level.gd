extends Node2D

export var song : String = ""
export var ambience : String = ""


func _ready():
	Music.play_music(song)
	Music.play_ambience(ambience)
