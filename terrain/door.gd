extends Node2D
signal opened
signal closed


onready var anim = $AnimationPlayer
onready var audio = $audio

var open = false

func trigger():
	if !anim.is_playing():
		open = !open
		if open:
			anim.play("open")
			emit_signal("opened")
		else:
			anim.play("close")
			emit_signal("closed")
		audio.play()


func activate():
	activate_target(self.global_position)

func activate_target(target_position):
	trigger()
		
