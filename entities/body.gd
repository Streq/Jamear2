extends KinematicBody2D

signal dead()
onready var skill = $skill if has_node("skill") else Skill.new()


export var speed : float
var velocity := Vector2()
var dir := Vector2()

onready var vista = $vista

func _physics_process(delta):
	velocity = dir*speed
	velocity = move_and_slide(velocity)

func die():
	emit_signal("dead")
#	queue_free()
