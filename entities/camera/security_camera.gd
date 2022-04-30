extends Node2D

export var speed_degrees = 90
export var pause_time = 0.5
onready var pivot = $pivot
onready var vista = $pivot/vista
onready var alarm = $alarm


func _physics_process(delta):
	var tree = get_tree()
	if tree.has_group("player"):
		var body = tree.get_nodes_in_group("player")[0].body
		if vista.can_see(body) and body.is_in_group("alien"):
			alarm.emit_signal("alarm", body)
			
