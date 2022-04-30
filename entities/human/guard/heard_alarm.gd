extends State

var path: Array = []
var new_path: Array = []
var levelNavigation: Navigation2D = null
var target := Vector2()
var body : KinematicBody2D
onready var timer = $reaction_time
func _enter(params):
	target = params[0]
	body = get_parent().get_parent()
	body.expression_anim.play("curious_alert")
	if body.memory.anxious:
		timer.start(0.01)
	else:
		timer.start()
	body.memory.anxious = true
	pass

func _exit():
	timer.stop()

func _physics_update(delta):
	var target_body = get_tree().get_nodes_in_group("player")[0].body
	var body = get_parent().get_parent()
	
	if body.memory.suspects(target_body) and body.get_node("vista").can_see(target_body):
		emit_signal("finish", "shoot_on_sight", null)
	else:
		body.dir = Vector2.ZERO

func _ready():
	yield(get_tree(),"idle_frame")
	var tree = get_tree()
	if tree.has_group("navigation"):
		levelNavigation = tree.get_nodes_in_group("navigation")[0]
	
	

func _on_reaction_time_timeout():
	emit_signal("finish", "goto_angry", [target])
