extends Node


var draw_vision = false

const WIDTH := 320*3
const HEIGHT := 224*3

func get_one_of(group:String):
	if get_tree().has_group(group):
		return get_tree().get_nodes_in_group(group)[0]
	return null

func get_player():
	return get_one_of("player")
