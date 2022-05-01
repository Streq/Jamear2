extends Node2D


var tracks = {}

onready var music_player : AudioCrossfadePlayer = $player
onready var ambience_player : AudioCrossfadePlayer = $player2
func _ready():
	for track in $tracks.get_children():
		tracks[track.name] = track

var main_song : AudioStreamPlayer

func play_ambience(track_name:String):
	var track : AudioStreamPlayer = tracks[track_name]
	ambience_player.crossfade_to(track.stream)
	

func play_music(track_name:String):
	var track : AudioStreamPlayer = tracks[track_name]
	ambience_player.crossfade_to(track.stream)
