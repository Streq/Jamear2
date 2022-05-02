extends State


func _physics_update(delta):
	owner.velocity = owner.dir*owner.speed*1.5
	owner.velocity = owner.move_and_slide(owner.velocity)
	if owner.velocity != Vector2.ZERO:
		owner.anim.play("flee")
	else:
		owner.anim.play("idle")
