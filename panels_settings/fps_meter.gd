extends HBoxContainer


var last_p : int = 0
var fps_p : float = 0.0

func _process(_delta: float) -> void:
	var now : int = OS.get_ticks_usec()
	fps_p = 1 / (float(now - last_p) / 1_000_000)
	last_p = now
	pass


var last_pp : int = 0
var fps_pp : float = 0

func _physics_process(_delta) -> void:
	var now : int = OS.get_ticks_usec()
	fps_pp = 1 / (float(now - last_pp) / 1_000_000)
	last_pp = now
	pass


func check_fps_balance() -> void:
	if fps_p < fps_pp and Engine.iterations_per_second > 10:
		Engine.iterations_per_second -= 1
	elif Engine.iterations_per_second < 60 and Engine.iterations_per_second * 1.5 < Engine.get_frames_per_second():
		Engine.iterations_per_second += 1
	pass


func update_labels() -> void:
	check_fps_balance()
	$Label2.text = "%.2f" % fps_p
	$Label4.text = "%.2f" % fps_pp
	$"../Engine/Label2".text = String(Engine.iterations_per_second)
	$"../Engine/Label4".text = String(Engine.get_frames_per_second())
	pass




