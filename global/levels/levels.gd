extends Node

onready var levels = get_children()
var current_level = -1

func next_level():
	current_level += 1
	get_tree().change_scene_to(levels[current_level].scene)
