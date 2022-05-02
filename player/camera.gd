extends Camera2D
export var zoom_level = 1 setget set_zoom_level
export var max_zoom_level = 3
export var  min_zoom_level = 1

func _ready():
#	zoom = Vector2(1,1)/zoom_level
	var map : TileMap = get_tree().get_nodes_in_group("map")[0]
	var tile_rect := map.get_used_rect()
	
	var top_left = tile_rect.position*map.cell_size
	limit_top = top_left.y
	limit_left = top_left.x
	var bottom_right = tile_rect.end*map.cell_size
	limit_bottom = bottom_right.y
	limit_right = bottom_right.x
	
	pass
	
func _input(event):
	if event.is_action_pressed("zoom_in"):
		self.zoom_level += 1
	if event.is_action_pressed("zoom_out"):
		self.zoom_level -= 1
		
		
func set_zoom_level(val):
	zoom_level = clamp(val, min_zoom_level, max_zoom_level)
#	zoom = Vector2(1,1)/zoom_level
