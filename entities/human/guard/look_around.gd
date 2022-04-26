extends State

onready var start_cooldown = $start_cooldown
onready var pause_duration = $pause_duration

var look_around := false
var look_right := false
var looks := 0
var initial_rotation : float
var body = null
func enter(params):
	look_around = false
	start_cooldown.start()
	body = get_parent().get_parent()
	initial_rotation = body.rotation
	body.dir = Vector2()
func physics_update(delta):
	
	var target_body = get_tree().get_nodes_in_group("player")[0].body
	if target_body.is_in_group("alien") and body.get_node("vista").can_see(target_body):
		emit_signal("finish", "shoot_on_sight", null)
	elif look_around:
		if looks < 20:
			var target_rot = initial_rotation
			var look_angle = deg2rad(90.0)
			if look_right:
				target_rot += look_angle
			else:
				target_rot -= look_angle
			body.rotation = Math.approach(body.rotation, target_rot, delta*3.0)
			var rotation = body.rotation
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
