extends Node


const move_speed : int = 4_000
const rot_speed : int = 100_000

onready var main : MainNode = get_node("/root/Main") as MainNode
onready var physics : RigidBody2D = $RigidBody2D
onready var camera : Camera2D = $Smoothing2D/Camera2D


func _physics_process(delta : float) -> void:
	# Movement
	var move_dir := Vector2.ZERO
	move_dir.x += Input.get_action_strength("move_right")
	move_dir.x -= Input.get_action_strength("move_left")
	move_dir.y -= Input.get_action_strength("move_up")
	move_dir.y += Input.get_action_strength("move_down")
	if move_dir.length_squared() > 1:
		move_dir = move_dir.normalized()
	physics.apply_central_impulse(move_dir * move_speed * delta)
	
	# Rotation
	var look_pos := physics.global_position + move_dir
	var rotang := physics.get_angle_to(look_pos)
	if abs(rotang) > 0.001:
		physics.apply_torque_impulse(rotang * rot_speed * delta)
	
	# Camera offset
	var dir_vec = Vector2.RIGHT.rotated(physics.rotation)
	camera.offset_v = dir_vec.y
	camera.offset_h = dir_vec.x
	
	# Camera offset
	if main:
		camera.offset.y = main.control_panel.rect_global_position.y
	
	pass














