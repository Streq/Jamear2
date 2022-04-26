extends State

export (NodePath) onready var patrol_path = get_node(patrol_path) as PatrolPath if patrol_path else null

export var index = 0

func physics_update(delta:float):
	var body = get_parent().get_parent()
#	move
	if is_instance_valid(patrol_path):
		var target = patrol_path.get_point(index)
		var distance: Vector2 = target.global_position - body.global_position
		if distance.length_squared() < 5.0:
			index += 1
		else:
			body.dir = distance.normalized()
			body.global_rotation = distance.angle()
		pass
#	look for target
	var target_body = get_tree().get_nodes_in_group("player")[0].body
	if target_body.is_in_group("alien") and body.get_node("vista").can_see(target_body):
		var current_dist_vec : Vector2 = target_body.global_position - body.global_position
			
		body.global_rotation = (current_dist_vec).angle()
		emit_signal("finish", "alert", null)
		body.dir = Vector2()
		body.get_node("memory").target_position = target_body.global_position
		
