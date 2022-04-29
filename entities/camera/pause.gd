extends State

onready var timer = $Timer

func _ready():
	timer.connect("timeout", self, "_on_timeout")

func _exit():
	timer.stop()

func _enter(params):
	timer.start(owner.pause_time)

func _on_timeout():
	emit_signal("finish", "looking_around", null)
