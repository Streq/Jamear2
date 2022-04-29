extends Node

signal alarm(who)

func activate():
	emit_signal("alarm", self)
