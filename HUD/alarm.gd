extends Control

onready var anim = $AnimationPlayer

func _ready():
	for alarm in Global.get_all_of("alarm"):
		alarm.connect("alarm", self, "_on_alarm")
func _on_alarm(alarm):
	anim.play("alarm")
