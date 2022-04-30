extends TextureProgress


func _ready():
	var pj = get_tree().get_nodes_in_group("player")[0]
	set_max(pj.max_transformation_time)
	set_value(pj.transformation_time)
	pj.connect("max_transformation_time_changed", self, "_set_max")
	pj.connect("transformation_time_changed", self, "_set_value")

func _set_max(value):
	set_max(value)
	
func _set_value(value):
	set_value(value)
