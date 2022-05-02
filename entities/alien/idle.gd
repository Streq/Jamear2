extends State
var can_vent = true
var active = false
onready var walk_sound = owner.get_node("walk_sound")
onready var anim = owner.get_node("AnimationPlayer")

func _enter(args):
	active = true
	var o = owner
	anim.play("idle")

	
	
func _exit():
	active = false


func _physics_update(delta):
	owner.velocity = owner.dir*owner.speed
	owner.velocity = owner.move_and_slide(owner.velocity)
	
	if owner.velocity != Vector2():
		anim.play("walk")
		if !walk_sound.playing:
			walk_sound.play()
	else:
		anim.play("idle")
		walk_sound.stop()

func _on_vent(vent):
	if active:
		emit_signal("finish", "vent", null)
