extends Control

onready var sprite = $Sprite

func _ready():
	var pj = Global.get_player()
	pj.connect("can_attack", self, "_on_can_attack")

func _on_can_attack(val):
	sprite.visible = val
