extends Skill

signal vent(vent)

onready var area = $Area2D

func trigger():
	var vents = area.get_overlapping_areas()
	if vents.size():
		var vent = vents[0].owner
		emit_signal("vent", vent)
