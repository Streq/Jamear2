extends Skill

signal vent(vent)


onready var vent_area = $vent_area
#onready var button_area = $button_area

func _physics_process(delta):
	self.usable = can_use()


func can_use():
	var vents = vent_area.get_overlapping_areas()
	return vents.size()>0

func trigger():
	if can_use():
		var vent = vent_area.get_overlapping_areas()[0].owner
		emit_signal("vent", vent)
