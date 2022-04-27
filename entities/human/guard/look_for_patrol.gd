extends Node

signal patrol_found(patrol_node)
func _ready():
	if owner.has_node("patrol"):
		emit_signal("patrol_found", owner.get_node("patrol"))
