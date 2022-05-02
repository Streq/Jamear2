extends Node2D

export var radius : float
export var angle_degs : float
export var can_see_through_walls : bool setget set_can_see_through_walls
export var is_jugador : bool setget set_is_jugador
export var active = true

func _ready():
	set_is_jugador(is_jugador)
	set_can_see_through_walls(can_see_through_walls)

func can_see(target: PhysicsBody2D):
	if is_instance_valid(target) and active:
		var angle = rad2deg(get_angle_to(target.global_position))
		if abs(angle) < angle_degs/2 and get_parent().global_position.distance_squared_to(target.global_position) < radius*radius:
			if can_see_through_walls:
				return true;
			var space_state = get_world_2d().direct_space_state
			var exceptions = get_tree().get_nodes_in_group("npc")
			var result = space_state.intersect_ray(get_parent().global_position, target.global_position, exceptions)
			return (result.has("collider") and result.collider == target)
	return false


func set_can_see_through_walls(val):
	can_see_through_walls = val
	if is_inside_tree():
		$vista_jugador/Light2D.shadow_enabled = !val
		$vista_npc/Light2D.shadow_enabled = !val

func set_is_jugador(val:bool):
	is_jugador = val
	if is_inside_tree():
		$vista_jugador.visible = val
		$vista_npc.visible = !val
