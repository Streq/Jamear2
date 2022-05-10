extends Skill

onready var button_area = $button_area

func trigger():
	var buttons = button_area.get_overlapping_areas()
	if buttons.size():
		var button = buttons[0].owner
		button.activate()
		return true
	return false
	
func trigger_target(target_pos):
	var buttons = button_area.get_overlapping_areas()
	if buttons.size():
		var button = buttons[0].owner
		button.activate_target(target_pos)
		return true
	return false


func _physics_process(delta):
	self.usable = button_area.get_overlapping_areas().size() > 0
