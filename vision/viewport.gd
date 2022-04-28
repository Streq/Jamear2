extends Viewport

func _ready():
	var size = get_parent().get_viewport().size
	var final_size = size*2*sqrt(2)
	self.size = final_size
