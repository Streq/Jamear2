extends Node2D


var other = null


func transport(body):
	body.global_position = other.global_position
