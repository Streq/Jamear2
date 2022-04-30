extends Node


var target_position = null
var target_direction = null
var suspect_body = null
var anxious = false

func _ready():
	if get_tree().has_group("player"):
		var player = get_tree().get_nodes_in_group("player")[0]
		player.connect("transformed", self, "_on_transformation")

func remember(body):
	target_direction = body.dir
	target_position = body.global_position
	suspect_body = body
	anxious = true

func suspects(body):
	return suspect_body == body or body.is_in_group("alien")

func _on_transformation():
	yield(get_tree(), "physics_frame")
	yield(get_tree(), "physics_frame")
	if get_tree().has_group("player"):
		var player = get_tree().get_nodes_in_group("player")[0]
		var body = get_parent()
		if body.vista.can_see(player.body):
			remember(player.body)
