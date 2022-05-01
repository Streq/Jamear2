extends Skill

export var BULLET : PackedScene
onready var noise : Area2D = $noise_area
onready var audio : AudioStreamPlayer2D = $AudioStreamPlayer2D
func trigger():
	shoot()

func shoot():
	var bullet = BULLET.instance()
	get_tree().current_scene.add_child(bullet)
	bullet.global_rotation = global_rotation
	bullet.global_position = global_position
	bullet.shooter = owner
	audio.play()
	var listeners = noise.get_overlapping_areas()
	for listener in listeners:
		listener._on_noise(noise)

func _physics_process(delta):
	self.usable = true
