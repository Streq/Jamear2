extends State

onready var anim : AnimationPlayer = owner.get_node("AnimationPlayer")
func _enter(params):
	anim.play("exit_vent")
	anim.connect("animation_finished", self, "_vent_out")

func _exit():
	anim.disconnect("animation_finished", self, "_vent_out")

func _physics_update(delta):
	pass

func _vent_out(anim_name):
	emit_signal("finish", "idle", null)
