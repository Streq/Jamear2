extends State
var can_vent = false

var vent = null
onready var anim : AnimationPlayer = owner.get_node("AnimationPlayer")
onready var sound : AudioStreamPlayer2D = owner.get_node("slide_through_sound")
func _enter(params):
	anim.play("vent")
	anim.connect("animation_finished", self, "_vent_in")
	sound.play()

func _exit():
	anim.disconnect("animation_finished", self, "_vent_in")

func _on_vent(vent):
	self.vent = vent

func _physics_update(delta):
	owner.global_position = lerp(owner.global_position, vent.global_position, delta*10.0)
	pass

func _vent_in(anim_name):
	vent.transport(owner)
	emit_signal("finish", "exit_vent", null)
