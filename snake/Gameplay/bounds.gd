class_name Bounds
extends Node

@onready var upper_left: Marker2D = $UpperLeft
@onready var lower_right: Marker2D = $LowerRight

var x_max: float
var x_min: float
var y_max: float
var y_min: float

func _ready() -> void:
	x_max = lower_right.position.x
	x_min = upper_left.position.x
	y_max = lower_right.position.y
	y_min = upper_left.position.y

func wrap_vector(v: Vector2) -> Vector2:
	var new_vector: Vector2 = v

	if new_vector.x > x_max:
		new_vector.x = x_min
	elif new_vector.x < x_min:
		new_vector.x = x_max

	if new_vector.y > y_max:
		new_vector.y = y_min
	elif new_vector.y < y_min:
		new_vector.y = y_max

	return new_vector
