extends Node

signal alarm(where, who)
signal deactivated()
var activated = false
onready var audio :AudioStreamPlayer2D = $alert
onready var timer : Timer = $Timer
onready var stinger :AudioStreamPlayer = $stinger

func _ready():
	timer.connect("timeout", self, "deactivate")

func activate():
	activate_target(self.global_position, null)

func deactivate():
	activated = false
	emit_signal("deactivated")


func activate_target(target_position, who):
	if !activated:
		emit_signal("alarm", target_position, who)
		if !audio.playing:
			audio.play()
#		stinger.play()
		activated = true
		timer.start()
