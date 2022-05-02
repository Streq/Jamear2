extends Sprite


func _ready():
	for detector in Global.get_all_of("player_detector"):
		detector.connect("player_detected", self, "_on_player_detected")
	
func _on_player_detected():
	frame = 1

func _physics_process(delta):
	frame = 0
