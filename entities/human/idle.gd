extends State


func _physics_update(delta):
	owner.velocity = owner.dir*owner.speed
	owner.velocity = owner.move_and_slide(owner.velocity)
