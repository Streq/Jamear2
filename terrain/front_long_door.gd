extends Node2D
onready var anim = $AnimationPlayer

func _on_opened():
	anim.play("open")

func _on_closed():
	anim.play("close")
