extends State


func _physics_update(delta):
	var speed = owner.speed
	owner.velocity = owner.dir*owner.speed
	owner.velocity = owner.move_and_slide(owner.velocity)
	if owner.velocity != Vector2.ZERO:
		owner.anim.play("walk")
	else:
		owner.anim.play("idle")
