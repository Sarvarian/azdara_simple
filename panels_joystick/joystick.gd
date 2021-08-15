extends Joystick


onready var pervious_button : Button = $"../HBoxContainer/Following"
onready var pervious_button_text : String = pervious_button.text


func _ready() -> void:
	_on_Following_pressed()
	pass


func _physics_process(_delta : float) -> void:
	Input.action_press("player1_move_down", output.y)
	Input.action_press("player1_move_right", output.x)
	pass


func _on_Fixed_pressed() -> void:
	change_mode(JoystickMode.FIXED, $"../HBoxContainer/Fixed")
	pass


func _on_Dynamic_pressed() -> void:
	change_mode(JoystickMode.DYNAMIC, $"../HBoxContainer/Dynamic")
	pass


func _on_Following_pressed() -> void:
	change_mode(JoystickMode.FOLLOWING, $"../HBoxContainer/Following")
	pass


func change_mode(mode: int, button : Button) -> void:
	pervious_button.text = pervious_button_text
	joystick_mode = mode
	pervious_button = button
	pervious_button_text = button.text
	button.text = "--- " + button.text + " ---"
	pass


