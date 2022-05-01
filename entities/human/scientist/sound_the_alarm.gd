extends State

var alarms = []
var alarm
var path: Array = []
var new_path: Array = []
var levelNavigation: Navigation2D = null
var target := Vector2()
var body : KinematicBody2D
func _enter(params):
	body = get_parent().get_parent()
	body.state.current.emit_signal("finish", "flee", null)
	alarm = get_closest_alarm()
	if alarm:
		target = alarm.global_position
	pass

func _physics_update(delta):
	if (target - body.global_position).length_squared() > 200.0:
		generate_path()
		navigate()
	else:
		body.skill.trigger_target(body.memory.target_position)

func _ready():
	yield(get_tree(),"idle_frame")
	var tree = get_tree()
	if tree.has_group("navigation"):
		levelNavigation = tree.get_nodes_in_group("navigation")[0]
	
	for alarm in get_tree().get_nodes_in_group("alarm"):
		alarms.push_back(alarm)
	

func navigate():
	if path.size() > 1:
		body.dir = body.global_position.direction_to(path[1])
		body.point_to(body.dir.angle())
		if body.global_position.distance_squared_to(path[0]) < body.speed*body.speed:
			path.pop_front()
	else:
		body.dir = Vector2.ZERO

func generate_path():
	if levelNavigation and target:
		new_path = levelNavigation.get_simple_path(body.global_position, target, true)
		if new_path.size() > 1:
			path = new_path

func get_closest_alarm():
	if is_instance_valid(levelNavigation):
		var closest_alarm = alarms[0]
		var current_dist := INF
		for alarm in alarms:
			if alarm != closest_alarm:
				var path = levelNavigation.get_simple_path(body.global_position, alarm)
				var dist := 0.0
				var pos = body.global_position
				for vec in path:
					dist += (vec-pos).length()
					pos = vec
				if dist < current_dist:
					current_dist = dist
					closest_alarm = alarm
		return closest_alarm
	return null
	
