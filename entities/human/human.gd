extends Node2D

onready var body = $body
onready var addons = $addons.get_children()
export var is_player := false


func _ready():
	reparent_addons(body)
	body.vista.is_jugador = is_player
	body.global_rotation = 0
	body.point_to(global_rotation)
	

func reparent_addons(to):
	for a in addons:
		if a.name in to:
			to[a.name] = a
		NodeUtils.reparent(a,to)


func _on_dead():
	queue_free()
