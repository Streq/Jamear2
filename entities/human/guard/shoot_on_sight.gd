extends Node

onready var cooldown = $cooldown

func _physics_process(delta):
	var target_body = get_tree().get_nodes_in_group("player")[0].body
	var body = get_parent()
	if target_body.is_in_group("alien") and body.get_node("vista").can_see(target_body):
		var current_dist_vec : Vector2 = target_body.global_position - body.global_position
			
		body.global_rotation = (current_dist_vec).angle()
			
		if cooldown.is_stopped():
			var gun = body.get_node("skill")
	#		gun.global_rotation = (target_body.global_position - body.global_position).angle()

	# predict player position (slightly incorrect, should use distance to final position, not current)
			var bullet_speed : float = gun.BULLET.instance().speed
			var current_dist : float = current_dist_vec.length()
			var d = current_dist/bullet_speed
			
			gun.global_rotation = (current_dist_vec+target_body.velocity*d).angle()
			gun.shoot()
			cooldown.start()
		
