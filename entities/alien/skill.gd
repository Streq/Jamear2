extends Skill

signal vent(vent)

onready var vent_area = $vent_area
onready var button_area = $button_area

func trigger():
	var vents = vent_area.get_overlapping_areas()
	if vents.size():
		var vent = vents[0].owner
		emit_signal("vent", vent)
	else:
		var buttons = button_area.get_overlapping_areas()
		if buttons.size():
			var button = buttons[0].owner
			button.activate()
