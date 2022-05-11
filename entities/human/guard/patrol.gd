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
		target = patrol_path.get_point(index).global_position
		
		generate_path()
		var global_pos = body.global_position
		var distance: Vector2 = path[-1] - path[0]
		var step_dist_squared = body.speed*body.speed*delta*delta
		if distance.length_squared() < step_dist_squared:
			index += 1
		else:
			navigate()
		
		pass
#	look for target
	var target_body = Global.get_player().body
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
	if body:
		var memory = body.get_node("memory")
		memory.anxious = false
	

func _ready():
	var tree = get_tree()
	if tree.has_group("navigation"):
		levelNavigation = tree.get_nodes_in_group("navigation")[0]
	

func navigate():
	if path.size() > 1:
		var global_pos = body.global_position
		var dir = global_pos.direction_to(path[1])
		body.dir = dir
		body.point_to(body.dir.angle())
		if body.global_position.distance_squared_to(path[0]) < body.speed*body.speed:
			path.pop_front()
	else:
		body.dir = Vector2.ZERO

func generate_path():
	if levelNavigation and target:
		var global_pos = body.global_position
		var new_path = levelNavigation.get_simple_path(global_pos, target, true)
		if new_path.size() > 1:
			path = new_path


