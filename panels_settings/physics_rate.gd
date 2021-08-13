extends HBoxContainer


func _ready() -> void:
	$Label2.text = String(Engine.iterations_per_second)
	$HSlider.value = Engine.iterations_per_second


func _on_HSlider_value_changed(value : float) -> void:
	Engine.iterations_per_second = int(value)
	$Label2.text = String(value)
	pass
