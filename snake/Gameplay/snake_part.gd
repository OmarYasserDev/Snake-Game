class_name SnakePart
extends Area2D
var last_position: Vector2~
func _ready() -> void:
	last_position = position
func move_to(new_position: Vector2) -> void:
	last_position = position
	position = new_position
	
