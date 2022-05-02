extends Node

signal player_detected()

func _physics_process(delta):
	var body = owner
	var target = Global.get_one_of("player").body
	if body.memory.suspects(target) and body.vista.can_see(target):
		emit_signal("player_detected")
	
