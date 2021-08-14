extends Joystick


func _ready() -> void:
	get_tree().root.connect("size_changed", self, "_on_Viewport_size_changed", [], 1)
	pass


func _physics_process(_delta : float) -> void:
	Input.action_press("move_down", output.y)
	Input.action_press("move_right", output.x)
	pass


func _on_Viewport_size_changed() -> void:
	pass
