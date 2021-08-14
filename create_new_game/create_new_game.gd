extends PanelContainer


onready var seed_line : LineEdit = $VBox/Seed/LineEdit
onready var name_line : LineEdit = $VBox/GameName/LineEdit


var save : SaveObject = SaveObject.new()


func _ready() -> void:
	seed_line.text = String(save.game_seed)
	name_line.placeholder_text = save.DefaultName
	pass


func _on_game_name_text_changed(new_text : String) -> void:
	if new_text.empty():
		new_text = save.DefaultName
	save.name = new_text
	save.game_seed = save.name.hash()
	seed_line.text = String(save.game_seed)
	pass


func _on_Submit_pressed() -> void:
	get_parent().new_game(save)
	pass
