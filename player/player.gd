extends KinematicBody2D

export var speed := 100.0

var velocity := Vector2()


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
		Global.draw_vision = !Global.draw_vision
		$player_vision.visible = !Global.draw_vision
