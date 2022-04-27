extends State

var target_position = null

func enter(params):
	$reaction_time.start()

func exit():
	$reaction_time.stop()

func _on_reaction_time_timeout():
	emit_signal("finish", "shoot_on_sight", null)

func physics_update(delta):
	var body = get_parent().get_parent()
	#	look for target
	var target_body = get_tree().get_nodes_in_group("player")[0].body
	if target_body.is_in_group("alien") and body.get_node("vista").can_see(target_body):
		var current_dist_vec : Vector2 = target_body.global_position - body.global_position
			
		body.global_rotation = (current_dist_vec).angle()
		body.dir = Vector2()
		
		body.get_node("memory").remember(target_body)
		
