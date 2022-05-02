extends State

var path: Array = []
var new_path: Array = []
var levelNavigation: Navigation2D = null
var target := Vector2()
var body : KinematicBody2D
var responds_to_alarm = true
var responds_to_noise = true
func _enter(params):
	target = params[0]
	body = get_parent().get_parent()
	pass

func _physics_update(delta):
	var target_body = get_tree().get_nodes_in_group("player")[0].body
	var body = get_parent().get_parent()
	var memory = body.get_node("memory")
	
	
	if memory.suspects(target_body) and body.get_node("vista").can_see(target_body):
		emit_signal("finish", "alert", null)
		memory.remember(target_body)
	elif (target - body.global_position).length_squared() > 1024.0:
		generate_path()
		navigate()
	else:
		emit_signal("finish", "look_around", null)

func _ready():
	yield(get_tree(),"idle_frame")
	var tree = get_tree()
	if tree.has_group("navigation"):
		levelNavigation = tree.get_nodes_in_group("navigation")[0]
	
	

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

		
