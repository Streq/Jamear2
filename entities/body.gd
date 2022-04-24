extends KinematicBody2D

export var speed : float
var velocity := Vector2()
var dir := Vector2()

onready var vista = $vista

func _physics_process(delta):
	move_and_slide(dir*speed)
