extends Node2D

onready var area = $Area2D

var states = ["idle", "walk"]

func trigger():
	if owner.state.current.name in states:
		var consumables = area.get_overlapping_areas()
		if consumables.size():
			var consumable = consumables[0]
			if is_instance_valid(consumable) and is_instance_valid(consumable.owner):
				if !consumable.owner.vista.can_see(owner):
					owner.state.current.emit_signal("finish", "consume", [consumable.owner])
