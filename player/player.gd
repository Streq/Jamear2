extends KinematicBody2D

export var speed := 100.0

var velocity := Vector2()
var alien_mode = true setget set_alien_mode

func _ready():
	set_alien_mode(alien_mode)

func is_pressed(action):
	return Input.is_action_pressed(action)

func _physics_process(delta):
	var dir = get_direction()
	velocity = dir * speed
	move_and_slide(velocity)
	pass
	
func get_direction() -> Vector2:
	return Bool.vec2(is_pressed("ui_right"), is_pressed("ui_left"), is_pressed("ui_down"), is_pressed("ui_up")).normalized()

func _input(event):
	if event.is_action_pressed("ui_accept"):
		set_alien_mode(!alien_mode)
		pass

func set_alien_mode(val):
	alien_mode = val
	$vista.visible = !alien_mode
	Global.draw_vision = alien_mode
