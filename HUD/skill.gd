extends Control

onready var sprite = $Sprite

func _ready():
	var pj = Global.get_player()
	pj.connect("can_skill", self, "_on_can_skill")

func _on_can_skill(val):
	sprite.visible = val
