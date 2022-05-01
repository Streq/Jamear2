extends Node

signal alarm(where)
signal deactivated()
var activated = false
onready var audio :AudioStreamPlayer2D = $alert
onready var stinger :AudioStreamPlayer = $stinger

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
#		stinger.play()
		activated = true
		
