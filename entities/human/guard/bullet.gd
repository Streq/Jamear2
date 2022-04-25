extends Area2D


export var speed = 400

var shooter = null

func _physics_process(delta):
	move_local_x(delta*speed)


func _on_body_entered(body):
	if body != shooter:
		queue_free()


func _on_hitbox_area_entered(area):
	if area.owner != shooter:
		area.owner.die()
