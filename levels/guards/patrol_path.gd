extends Node2D
class_name PatrolPath

onready var points := get_children()


func get_point(index:int)->Node2D:
	return points[index%points.size()]
