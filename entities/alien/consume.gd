extends State

var victim = null


func _enter(params):
	victim = params[0]
	owner.anim.play("consume")
	victim.global_position = owner.global_position
	victim.state.current.emit_signal("finish", "consumed", null)
	owner.anim.connect("animation_finished", self, "_on_animation_finished")
	pass

func _exit():
	owner.anim.disconnect("animation_finished", self, "_on_animation_finished")

func _physics_update(delta):
	owner.dir = Vector2()
	owner.velocity = Vector2()
func _on_animation_finished(anim_name):
	if anim_name == "consume":
		owner.get_parent()._consume(victim)
		victim.queue_free()
	pass
