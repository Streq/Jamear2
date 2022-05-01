extends Node

signal alarm(where)
var activated = false


func activate():
	activate_target(self.global_position)

func activate_target(target_position):
	if !activated:
		emit_signal("alarm", target_position)
		$alert.play()
		activated = true
