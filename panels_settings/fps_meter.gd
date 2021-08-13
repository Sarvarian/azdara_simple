extends HBoxContainer


var last : int = 0
var fps : float = 0.0

func _process(_delta: float) -> void:
	var now : int = OS.get_ticks_usec()
	fps = 1 / (float(now - last) / 1_000_000)
	last = now
	pass

func _physics_process(_delta) -> void:
	$Label2.text = "%.2f" % fps
	pass
