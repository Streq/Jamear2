extends Camera2D
export var zoom_level = 1 setget set_zoom_level
const max_zoom_level = 4
const min_zoom_level = 1

func _ready():
	zoom = Vector2(1,1)/zoom_level

func _input(event):
	if event.is_action_pressed("zoom_in"):
		self.zoom_level += 1
	if event.is_action_pressed("zoom_out"):
		self.zoom_level -= 1
		
		
func set_zoom_level(val):
	zoom_level = clamp(val, min_zoom_level, max_zoom_level)
	zoom = Vector2(1,1)/zoom_level
