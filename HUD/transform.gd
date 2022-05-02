extends Control

onready var label = $Label

var current = null

func _ready():
	var pj = Global.get_player()
	pj.connect("current_transform_target_changed", self, "_on_current_transform_target_changed")
	pj.connect("can_transform", self, "_on_can_transform")

func _on_current_transform_target_changed(val):
	if current:
		current.visible = false
	current = get_node(val)
	current.visible = true

func _on_can_transform(val):
	current.modulate = Color.white if val else Color(0.25,0.25,0.25)
	label.visible = val
