extends Node2D

onready var light = $Light2D

func _process(delta):
	light.visible = Global.draw_vision
