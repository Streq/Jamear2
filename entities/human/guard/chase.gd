extends State

onready var cooldown = $cooldown

func physics_update(delta):
	var target_body = get_tree().get_nodes_in_group("player")[0].body
	var body = get_parent().get_parent()
	if target_body.is_in_group("alien") and body.get_node("vista").can_see(target_body):
		emit_signal("finish", "shoot_on_sight", null)
	else:
		var target_from_memory = body.get_node("memory").target_position
		var dist = target_from_memory - body.global_position
		if dist.length_squared() < 5.0:
			emit_signal("finish", "look_around", null)
		else:
			body.dir = dist.normalized()
		
	
