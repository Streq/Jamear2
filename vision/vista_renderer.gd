extends Node2D

export var use_owner_angle := true
export var angle_degrees := 360

func _draw():
	var center = Vector2.ZERO
	var vista = owner
	if use_owner_angle:
		var half_vision_angle = vista.angle_degs/2.0
		RenderUtils.draw_circle_slice(self, center, vista.radius, -half_vision_angle, half_vision_angle, Color.white)
	else:
		var half_vision_angle = angle_degrees/2.0
		RenderUtils.draw_circle_slice(self, center, vista.radius, -half_vision_angle, half_vision_angle, Color.white)
	
