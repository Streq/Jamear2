extends Node

signal alarm(where)
signal deactivated()
var activated = false
onready var audio :AudioStreamPlayer2D = $alert

func _ready():
	audio.connect("finished", self, "deactivate")

func activate():
	activate_target(self.global_position)

func deactivate():
	activated = false
	emit_signal("deactivated")


func activate_target(target_position):
	if !activated:
		emit_signal("alarm", target_position)
		audio.play()
		activated = true
		
