extends Node2D

func _ready():
	var pj = Global.get_player()
	pj.connect("can_attack", self, "_on_can_attack")

func _on_can_attack(val):
	visible = val
