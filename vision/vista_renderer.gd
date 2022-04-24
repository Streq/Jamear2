extends Node2D


func _draw():
	var vista = owner
	var center = Vector2.ZERO
	var half_vision_angle = vista.angle_degs/2.0
	RenderUtils.draw_circle_slice(self, center, vista.radius, -half_vision_angle, half_vision_angle, Color.white)

