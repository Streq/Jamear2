extends Area2D

onready var splatter :CPUParticles2D = $splatter
export var speed = 400

var shooter = null

func _physics_process(delta):
	move_local_x(delta*speed)


func _on_body_entered(body):
	if body != shooter:
		queue_free()


func _on_hitbox_area_entered(area):
	if is_instance_valid(shooter) and is_instance_valid(area):
		var target_entity = area.owner.get_parent()
		var shooter_entity = shooter.get_parent()
		if area.owner != shooter and target_entity.is_player != shooter_entity.is_player:
			queue_free()
			area.owner.die()
			var transform_splatter = splatter.global_transform
			NodeUtils.reparent(splatter, get_tree().current_scene)
			splatter.global_transform = transform_splatter
			splatter.play()
			
	else:
		queue_free()
