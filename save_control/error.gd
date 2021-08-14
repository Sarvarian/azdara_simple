extends PanelContainer


func msg(msg: String) -> void:
	$CenterContainer/Label.text = msg
	visible = true
	pass
