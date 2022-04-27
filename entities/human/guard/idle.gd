extends State

func physics_update(delta):
	var target_body = get_tree().get_nodes_in_group("player")[0].body
	var body = get_parent().get_parent()
	if target_body.is_in_group("alien") and body.get_node("vista").can_see(target_body):
		var current_dist_vec : Vector2 = target_body.global_position - body.global_position
		
		body.global_rotation = (current_dist_vec).angle()
		body.get_node("memory").remember(target_body)
		emit_signal("finish", "alert", null)
		
