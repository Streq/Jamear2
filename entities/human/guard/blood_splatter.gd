extends CPUParticles2D

onready var timer = $Timer

func _on_Timer_timeout():
	set_process(false)
	set_process_internal(false)
	set_physics_process(false)
	set_physics_process_internal(false)
	set_process_input(false)
	set_process_unhandled_input(false)
	set_process_unhandled_key_input(false)
	

func play():
	emitting = true
	timer.start()
	
