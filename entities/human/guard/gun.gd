extends Node2D

export var BULLET : PackedScene

func trigger():
	shoot()

func shoot():
	var bullet = BULLET.instance()
	get_tree().current_scene.add_child(bullet)
	bullet.global_rotation = global_rotation
	bullet.global_position = global_position
	bullet.shooter = owner
