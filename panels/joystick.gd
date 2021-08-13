extends Joystick


func _physics_process(_delta : float) -> void:
	Input.action_press("move_down", output.y)
	Input.action_press("move_right", output.x)
	pass
