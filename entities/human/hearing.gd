extends Area2D

export (NodePath) onready var mind_state = get_node(mind_state) as StateMachine

func _on_scream(scream, target, who):
	if "responds_to_alarm" in mind_state.current:
		mind_state.current.emit_signal("finish", "heard_alarm", [target, who])
		

func _on_noise(noise):
	var body = get_parent()
	var target_body = noise.emisor
		
	if can_see_source_of_noise(noise):
		if target_body.get_parent().is_in_group("player"):
			body.memory.remember(target_body)
	elif "responds_to_noise" in mind_state.current:
		body.look_at_position(target_body.global_position)
		mind_state.current.emit_signal("finish", "heard_noise", [noise.global_position, null])
		
func can_see_source_of_noise(noise):
	var body = get_parent()
	
	return body.vista.can_see(noise.emisor)
	
