extends Node

signal alarm(where)

func activate():
	emit_signal("alarm", self.global_position)

func activate_target(target_position):
	emit_signal("alarm", target_position)
