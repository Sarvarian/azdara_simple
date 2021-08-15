extends HBoxContainer


func _ready() -> void:
	$Label2.text = String(Engine.iterations_per_second)
	$HSlider.value = Engine.iterations_per_second
	pass


func _on_HSlider_value_changed(value : float) -> void:
	Engine.iterations_per_second = int(value)
	$Label2.text = String(value)
	pass


func _on_Reset_pressed() -> void:
	var value : int = ProjectSettings.get("physics/common/physics_fps")
	Engine.iterations_per_second = value
	$Label2.text = String(value)
	$HSlider.value = value
	pass


func change_physics_rate(value : int) -> void:
	Engine.iterations_per_second = value
	$Label2.text = String(value)
	$HSlider.value = value
	pass
