class_name AI_Blackboard
extends Reference


signal changed


var data : Dictionary = {} setget _set_data, _get_data


func _set_data(_value : Dictionary) -> void:
	return

func _get_data() -> Dictionary:
	return {}


func get_key(key: String):
	return data[key]


func set_key(key: int, value) -> void:
	data[key] = value
	emit_signal("changed")
