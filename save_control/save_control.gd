extends Node


const SavePath : String = "user://save"


var save : SaveObject = null
var file : File = File.new()


func _ready() -> void:
	if not Directory.new().file_exists(SavePath):
		$CreateNewGame.visible = true
		return
	
	var err : int = file.open_encrypted_with_pass(SavePath, File.READ_WRITE, OS.get_unique_id())
	if err:
		$Error.msg("Failed to open save file. Godot error: %d" % err)
	
	var json : JSONParseResult = JSON.parse(file.get_as_text())
	
	if json.error:
		$Error.msg("Save file corrupted. Godot error: %d" % json.error)
		return
	
	var res : Array = json.result as Array
	
	save = SaveObject.new()
	save.load_arr(res)
	
	if not save or not res:
		$Error.msg("Loading save file failed!")
	
	$CreateNewGame.save.free()
	$CreateNewGame.queue_free()
	remove_child($CreateNewGame)
	
	pass


func _exit_tree() -> void:
	file.close()
	if save:
		save.free()


func new_game(new_save : SaveObject) -> void:
	save = new_save
	
	var err : int = file.open_encrypted_with_pass(SavePath, File.WRITE, OS.get_unique_id())
	if err:
		$Error.msg("Failed to create save file. Godot error: %d" % err)
	
	var json : String = JSON.print(save.to_arr())
	file.store_string(json)
	
	$CreateNewGame.queue_free()
	remove_child($CreateNewGame)
	
	pass
