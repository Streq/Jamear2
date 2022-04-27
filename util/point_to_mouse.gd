extends Node


func _physics_process(delta):
	var parent = get_parent()
	parent.point_to(InputUtils.get_dist_to_mouse(parent).angle())
