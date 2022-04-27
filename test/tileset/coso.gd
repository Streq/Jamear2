extends KinematicBody2D

var velocity: Vector2 = Vector2.ZERO
const SPEED = 200.0
var path: Array = []
var new_path: Array = []
var levelNavigation: Navigation2D = null
var target

func _ready():
	yield(get_tree(),"idle_frame")
	var tree = get_tree()
	if tree.has_group("navigation"):
		levelNavigation = tree.get_nodes_in_group("navigation")[0]
	

func _physics_process(delta):
	generate_path()
	navigate()
	move(delta)
	

func navigate():
	if path.size() > 1:
		velocity = global_position.direction_to(path[1]) * SPEED
		if global_position.distance_squared_to(path[0]) < SPEED*SPEED:
			path.pop_front()
	else:
		velocity = Vector2.ZERO

func generate_path():
	if levelNavigation and target:
		new_path = levelNavigation.get_simple_path(global_position, target, true)
		if new_path.size() > 1:
			path = new_path
func move(delta):
	velocity= move_and_slide(velocity)

func _input(event):
	if event is InputEventMouseButton:
		var m : InputEventMouseButton = event
		target = get_viewport_transform().xform_inv(m.global_position)
		 
		
