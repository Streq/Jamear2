extends Node

export (NodePath) onready var mind_state = get_node(mind_state) as StateMachine


func _ready():
	for alarm in get_tree().get_nodes_in_group("alarm"):
		alarm.connect("alarm", self, "_on_alarm")
	
func _on_alarm(alarm):
	if "responds_to_alarm" in mind_state.current:
		mind_state.current.emit_signal("finish", "heard_alarm", [alarm.global_position])
