extends State

onready var start_cooldown = $start_cooldown
onready var pause_duration = $pause_duration

var responds_to_alarm = true
var responds_to_noise = true
var look_around := false
var look_right := false
var looks := 0
var initial_rotation : float
var body = null

func enter(params):
	look_around = false
	start_cooldown.start()
	body = get_parent().get_parent()
	initial_rotation = body.point_angle
	body.dir = Vector2()
func physics_update(delta):
	
	var target_body = get_tree().get_nodes_in_group("player")[0].body
	var memory = body.get_node("memory")
	
	if memory.suspects(target_body) and body.get_node("vista").can_see(target_body):
		emit_signal("finish", "alert", null)
		memory.remember(target_body)
	elif look_around:
		if looks < 20:
			var target_rot = initial_rotation
			if looks == 0:
				if memory.target_direction:
					target_rot = memory.target_direction.angle()
				else: 
					target_rot = initial_rotation
			else:
				var look_angle = deg2rad(160.0)
				target_rot += look_angle
				
				
			body.point_to(Math.approach(body.point_angle, target_rot, delta*3.0))
			var rotation = body.point_angle
			if abs(rotation - target_rot) < PI/90.0:
				looks += 1
				look_right = !look_right
				pause_duration.start()
				look_around = false
		else:
			emit_signal("finish", "idle", null)
	
func exit():
	start_cooldown.stop()
	pause_duration.stop()

func _on_start_cooldown_timeout():
	look_around = true
	look_right = bool(randi()%2)


func _on_pause_duration_timeout():
	look_around = true
