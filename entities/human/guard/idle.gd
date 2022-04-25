extends State

onready var reaction_time = $reaction_time

func physics_update(delta):
	var target_body = get_tree().get_nodes_in_group("player")[0].body
	var body = get_parent().get_parent()
	if target_body.is_in_group("alien") and body.get_node("vista").can_see(target_body):
		var current_dist_vec : Vector2 = target_body.global_position - body.global_position
			
		body.global_rotation = (current_dist_vec).angle()
			
		if reaction_time.is_stopped():
			reaction_time.start()
			yield(reaction_time, "timeout")
			emit_signal("finish", "shoot_on_sight", null)
		
