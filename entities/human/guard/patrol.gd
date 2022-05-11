extends State

export (NodePath) onready var patrol_path = get_node(patrol_path) as PatrolPath if patrol_path else null
var responds_to_alarm = true
var responds_to_noise = true
export var index = 0




var path: Array = []
var levelNavigation: Navigation2D = null
var target := Vector2()
var body : KinematicBody2D

func physics_update(delta:float):
	body = get_parent().get_parent()
#	move
	if is_instance_valid(patrol_path):
		var target = patrol_path.get_point(index)
		var distance: Vector2 = target.global_position - body.global_position
		if distance.length_squared() < 5.0:
			index += 1
		generate_path()
		navigate()
		
		body.dir = distance.normalized()
		body.point_to(distance.angle())
		pass
#	look for target
	var target_body = get_tree().get_nodes_in_group("player")[0].body
	var memory = body.get_node("memory")
	
	if memory.suspects(target_body) and body.get_node("vista").can_see(target_body):
		var current_dist_vec : Vector2 = target_body.global_position - body.global_position
			
		body.point_to(current_dist_vec.angle())
		emit_signal("finish", "alert", null)
		body.dir = Vector2()
		body.get_node("memory").remember(target_body)
		
func set_patrol(patrol):
	patrol_path = patrol

func _enter(params):
	pass
	

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
		var new_path = levelNavigation.get_simple_path(body.global_position, target, true)
		if new_path.size() > 1:
			path = new_path


