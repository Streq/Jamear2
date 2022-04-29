extends Node


var target_position = null
var target_direction = null
var suspect_body = null
var anxious = false

func remember(body):
	target_direction = body.dir
	target_position = body.global_position
	suspect_body = body
	anxious = true

func suspects(body):
	return suspect_body == body or body.is_in_group("alien")
