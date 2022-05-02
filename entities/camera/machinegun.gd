extends Node2D

onready var cooldown = $cooldown
onready var gun = $skill
func _ready():
	get_parent().connect("player_detected", self, "_on_player_detected")
	
func _on_player_detected():
	var pj = Global.get_player()
	var target_body = pj.body
	var current_dist_vec : Vector2 = target_body.global_position - global_position
			
	if cooldown.is_stopped():
#		gun.global_rotation = (target_body.global_position - body.global_position).angle()

# predict player position (slightly incorrect, should use distance to final position, not current)
		var bullet_speed : float = gun.BULLET.instance().speed
		var current_dist : float = current_dist_vec.length()
		var d = current_dist/bullet_speed
		
		global_rotation = (current_dist_vec+target_body.velocity*d).angle()
		gun.shoot()
		cooldown.start()
