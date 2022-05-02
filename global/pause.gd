extends Node

onready var display = $display

func _input(event):
	if event.is_action_pressed("pause"):
		get_tree().paused = !get_tree().paused
		display.visible = get_tree().paused
		
