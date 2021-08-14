extends Node


const SavePath : String = "user://save"


var save : SaveObject = null
var file : File = File.new()


func _ready() -> void:
	if not Directory.new().file_exists(SavePath):
		$CreateNewGame.visible = true
		return
	
	var err : int = file.open_encrypted_with_pass(SavePath, File.READ_WRITE, OS.get_unique_id())
#	var err : int = file.open(SavePath, File.READ_WRITE)
	if err:
		$Error.msg("Failed to open save file. Godot error: %d" % err)
		return
	
	var res = file.get_as_text()
	
	var json : JSONParseResult = JSON.parse(res)
	
	if json.error:
		$Error.msg("Save file corrupted. Json Parse Error: \nError: %d\nError String: %s\nError Line: %d\nJSON Text: %s" % [json.error, json.error_string, json.error_line, res])
		return
	
	var array : Array = json.result as Array
	
	save = SaveObject.new()
	save.load_arr(array)
	
	if not save or not array:
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
#	var err : int = file.open(SavePath, File.WRITE)
	if err:
		$Error.msg("Failed to create save file. Godot error: %d" % err)
	
	var json : String = JSON.print(save.to_arr())
	file.store_string(json)
	file.close()
	
	$CreateNewGame.queue_free()
	remove_child($CreateNewGame)
	
	pass


func _on_DeleteButton_pressed() -> void:
	file.close()
	var dir : Directory = Directory.new()
	var err : int = dir.remove(SavePath)
	if err:
		$Error.msg("Deleting save file failed. Godot error: %d" % err)
	else:
		$Error.msg("Deleting save file succeed. Restart the game.")
	pass















