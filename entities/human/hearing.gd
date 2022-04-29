extends Area2D

export (NodePath) onready var mind_state = get_node(mind_state) as StateMachine

func _on_scream(scream, target):
	if "responds_to_alarm" in mind_state.current:
		mind_state.current.emit_signal("finish", "goto_angry", [target.global_position])
		

func _on_noise(noise):
	if "responds_to_alarm" in mind_state.current:
		if can_see_source_of_noise(noise):
			var target_body = noise.emisor
			if target_body.get_parent().is_in_group("player"):
				var body = get_parent()
				body.get_node("memory").remember(target_body)
		else:
			mind_state.current.emit_signal("finish", "goto_curious", [noise.global_position])
	
func can_see_source_of_noise(noise):
	var body = get_parent()
	
	return body.vista.can_see(noise.emisor)
	
