extends Node


func _physics_process(delta):
	var pj = get_tree().get_nodes_in_group("player")[0]
	if pj.alien_mode and get_parent().get_node("vista").can_see(pj):
		get_tree().reload_current_scene()
