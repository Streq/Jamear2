extends Sprite

signal alarm(who)

func activate():
	emit_signal("alarm", self)
