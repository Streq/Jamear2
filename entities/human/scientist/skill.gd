extends Skill

onready var button_area = $button_area

func trigger():
	var buttons = button_area.get_overlapping_areas()
	if buttons.size():
		var button = buttons[0].owner
		button.activate()
