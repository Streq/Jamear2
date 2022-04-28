extends Node2D


func _ready():
	var vents = get_children()
	assert(vents.size()==2)
	vents[0].other = vents[1]
	vents[1].other = vents[0]
	

