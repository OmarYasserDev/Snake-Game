class_name Gameplay
extends Node2D

@onready var Head_snake: Area2D = $Head
@onready var bounds = $Bounds

var time_between_moves: float = 0.2
var time_since_last_moves: float = 0.0
var move_dir: Vector2 = Vector2.RIGHT


func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_up"):
		move_dir = Vector2.UP
	elif Input.is_action_just_pressed("ui_right"):
		move_dir = Vector2.RIGHT
	elif Input.is_action_just_pressed("ui_left"):
		move_dir = Vector2.LEFT
	elif Input.is_action_just_pressed("ui_down"):
		move_dir = Vector2.DOWN


func _physics_process(delta: float) -> void:
	time_since_last_moves += delta

	if time_since_last_moves >= time_between_moves:
		update_snake()
		time_since_last_moves -= time_between_moves


func update_snake() -> void:
	var new_pos: Vector2 = Head_snake.position + move_dir * 32

	new_pos = bounds.wrap_vector(new_pos)

	Head_snake.position = new_pos
