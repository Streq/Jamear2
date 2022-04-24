extends Node2D

export var radius : float
export var angle_degs : float
export var can_see_through_walls : bool = true
export var is_jugador := false setget set_is_jugador

func _ready():
	set_is_jugador(is_jugador)


func set_is_jugador(val:bool):
	is_jugador = val
	$vista_jugador.visible = val
	$vista_npc.visible = !val

func can_see(target: PhysicsBody2D):
	if is_instance_valid(target):
		var angle = rad2deg(get_angle_to(target.global_position))
		if abs(angle) < angle_degs/2 and get_parent().global_position.distance_squared_to(target.global_position) < radius*radius:
			var space_state = get_world_2d().direct_space_state
			var result = space_state.intersect_ray(get_parent().global_position, target.global_position, [get_parent()])
			return (result.has("collider") and result.collider == target)
	return false
