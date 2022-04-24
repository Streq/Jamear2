extends Node


func _physics_process(delta):
	var pj = get_tree().get_nodes_in_group("player")[0].body
	var body = get_parent()
	if pj.is_in_group("alien") and body.get_node("vista").can_see(pj):
		get_tree().reload_current_scene()
