extends Node2D
class_name Skill

signal can_be_used(val)

var usable : bool = false setget set_usable

func trigger():
	pass

func set_usable(val:bool):
	if usable != val:
		usable = val
		emit_signal("can_be_used", usable)
