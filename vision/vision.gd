extends Node2D


export var angle_degrees = 90.0
export var radius = 160.0

func _physics_process(delta):
	update()

func _draw():
	if Global.draw_vision:
		var center = Vector2.ZERO
		var half_vision_angle = angle_degrees/2.0
		RenderUtils.draw_circle_slice(self, center, radius, -half_vision_angle, half_vision_angle, Color(1,1,1,1))
