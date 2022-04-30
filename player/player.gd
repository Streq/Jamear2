extends Node2D

signal transformation_time_changed(current_value)
signal max_transformation_time_changed(current_value)

export var max_transformation_time = 5.0 setget set_max_transformation_time

const is_player = true

var body : KinematicBody2D = null
onready var addons = $addons.get_children()
var transformation_time = 5.0 setget set_transformation_time
var transformed = false

onready var alien_bod : PackedScene = preload("res://entities/alien/alien_body.tscn")
var target_bod : PackedScene = null
func _ready():
	transform_into(alien_bod.instance())
	self.transformation_time = transformation_time
	self.max_transformation_time = max_transformation_time

func reparent_addons(to):
	for a in addons:
		NodeUtils.reparent(a,to)

func transform_into(new_body: KinematicBody2D):
	var old_body = body
	reparent_addons(new_body)
	
	if is_instance_valid(old_body):
		var transform = old_body.global_transform
		remove_child(old_body)
		add_child(new_body)
#		body.set_as_toplevel(true)
		new_body.global_transform = transform
		old_body.queue_free()
	else:
		add_child(new_body)
#		new_body.set_as_toplevel(true)
		new_body.global_transform = global_transform
	body = new_body
	body.connect("dead", self, "_on_dead")
	var vision = body.get_node("vista")
	vision.is_jugador = true

func _on_dead():
	get_tree().reload_current_scene()

func transform_into_deferred(new_body: KinematicBody2D):
	call_deferred("transform_into", new_body)

func _physics_process(delta):
	var dir = InputUtils.get_input_dir()
	body.dir = dir.normalized()
	
	
	if transformed:
		self.transformation_time = max(transformation_time-delta, 0)
		if !transformation_time:
			detransform()
	else:
		self.transformation_time = min(transformation_time+delta, max_transformation_time)
	pass
	Global.draw_vision = !transformed



func attempt_transform():
	if target_bod and !transformed and transformation_time == max_transformation_time:
		transform_into_target()
	elif transformed:
		detransform()

func transform_into_target():
	transform_into_deferred(target_bod.instance())
	set_deferred("transformed", true)
func detransform():
	transform_into_deferred(alien_bod.instance())
	set_deferred("transformed", false)

func set_transformation_time(val):
	transformation_time = clamp(val, 0, max_transformation_time)
	emit_signal("transformation_time_changed", val)
func set_max_transformation_time(val):
	max_transformation_time = val
	emit_signal("max_transformation_time_changed", val)
	
func _input(event):
	if event.is_action_pressed("detransform") and transformed:
		detransform()
	if event.is_action_pressed("skill"):
		body.skill.trigger()

func _on_consumable_entered(area):
	target_bod = load(area.get_parent().filename)
	transformation_time = max_transformation_time
	transform_into_target()
	
