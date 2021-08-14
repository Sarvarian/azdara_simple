class_name SaveObject
extends Object


const DefaultName : String = "Unnamed"


var name : String = DefaultName
var game_seed : int = name.hash()


func to_arr() -> Array:
	var arr : Array = []
	
	arr.append(name)
	arr.append(game_seed)
	
	return arr


func load_arr(arr : Array):
	
	name = arr[0]
	game_seed = arr[1]
	
	pass





