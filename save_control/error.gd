extends PanelContainer


func msg(msg: String) -> void:
	$VBoxContainer/CenterContainer/Label.text = msg
	visible = true
	pass
