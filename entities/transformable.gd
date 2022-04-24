extends Area2D

func _on_area_entered(area):
	die()
	
func die():
	var entity = get_parent().get_parent()
	entity.queue_free()
