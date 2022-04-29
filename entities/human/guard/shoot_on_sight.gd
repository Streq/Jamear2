extends State

onready var cooldown = $cooldown
var memory
var body
func _enter(params):
	body = get_parent().get_parent()
	memory = body.get_node("memory")
	

func physics_update(delta):
	var target_body = get_tree().get_nodes_in_group("player")[0].body
	if memory.suspects(target_body) and body.vista.can_see(target_body):
		var current_dist_vec : Vector2 = target_body.global_position - body.global_position
			
		body.point_to(current_dist_vec.angle())
		body.dir = Vector2()
		
		memory.remember(target_body)
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
#	can't see player, look for him
	else:
		emit_signal("finish", "chase", null)
