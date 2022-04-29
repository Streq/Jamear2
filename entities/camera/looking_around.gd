extends State


onready var path : Array = owner.get_node("path").get_children()

var index = 0

var elapsed = 0.0
var start
var end
var start_rot
var end_rot
var angle
func _enter(params):
	elapsed = 0.0
	start = path[index].global_position - owner.global_position
	end = path[(index+1)%path.size()].global_position - owner.global_position
	start_rot = start.angle()
	end_rot = end.angle()
	angle = abs(start.angle_to(end))

func _physics_update(delta):
	var progress = elapsed/angle*deg2rad(owner.speed_degrees)
	owner.pivot.global_rotation = lerp_angle(start_rot, end_rot, progress)
	elapsed += delta
	if progress >= 1.0:
		index = (index+1)%path.size()
		emit_signal("finish", "pause", null)
