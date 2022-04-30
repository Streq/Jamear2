extends KinematicBody2D

signal dead()

onready var display = $display
onready var vista = $vista
onready var skill = $skill if has_node("skill") else Skill.new()
onready var anim = $AnimationPlayer
onready var expression_anim = $AnimationPlayerExpressions
export var speed : float
var velocity := Vector2()
var dir := Vector2()
var point_angle = 0
var memory
var yell

func die():
	emit_signal("dead")
#	queue_free()


func point_to(global_rotation):
	vista.global_rotation = global_rotation
	skill.global_rotation = global_rotation
	display.scale.x = 1.0-float(cos(global_rotation)<0)*2
	point_angle = global_rotation
func look_at_position(global_pos):
	point_to(self.global_position.angle_to_point(global_pos))
