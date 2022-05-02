extends State
onready var anim : AnimationPlayer = owner.get_node("AnimationPlayer")
onready var sound : AudioStreamPlayer2D = owner.get_node("slide_through_sound")
func _enter(params):
	anim.play_backwards(params[0])
	anim.connect("animation_finished", self, "_anim_finished")

func _anim_finished(name):
	emit_signal("finish", "idle", null)
	owner.emit_signal("transform_finished")
