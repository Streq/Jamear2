extends Node2D

onready var animation = $AnimationPlayer

func _input(event):
	if event.is_action_pressed("attack") and !animation.is_playing():
		animation.play("consume")
		

