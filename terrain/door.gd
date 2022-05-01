extends Node2D

onready var anim = $AnimationPlayer
onready var audio = $audio
var open = false

func trigger():
	if !anim.is_playing():
		open = !open
		if open:
			anim.play("open")
		else:
			anim.play("close")
		audio.play()


func activate():
	activate_target(self.global_position)

func activate_target(target_position):
	trigger()
		
