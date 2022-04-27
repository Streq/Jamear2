extends Node


var target_position = null
var target_direction = null

func remember(body):
	target_direction = body.dir
	target_position = body.global_position
