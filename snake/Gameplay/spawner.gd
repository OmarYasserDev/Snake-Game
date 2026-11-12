class_name Spawner
extends Node2D

signal tail_added(tail: Tail)

@export var bounds: Bounds
@export var grid_size: int = 32

const FOOD_SCENE: PackedScene = preload("res://Gameplay/food.tscn")
const TAIL_SCENE: PackedScene = preload("res://Gameplay/tail.tscn")


func spawn_food() -> void:
	var spawn_point: Vector2 = Vector2.ZERO

	var min_x: int = ceili((bounds.x_min + grid_size) / float(grid_size))
	var max_x: int = floori((bounds.x_max - grid_size) / float(grid_size))

	var min_y: int = ceili((bounds.y_min + grid_size) / float(grid_size))
	var max_y: int = floori((bounds.y_max - grid_size) / float(grid_size))

	if min_x > max_x or min_y > max_y:
		push_warning("Bounds are too small to spawn food!")
		return

	spawn_point.x = randi_range(min_x, max_x) * grid_size
	spawn_point.y = randi_range(min_y, max_y) * grid_size

	var food = FOOD_SCENE.instantiate()

	food.add_to_group("food")
	food.position = spawn_point

	get_parent().add_child(food)


func spawn_tail(tail_position: Vector2) -> void:
	var tail = TAIL_SCENE.instantiate() as Tail

	tail.position = tail_position

	get_parent().add_child(tail)

	tail_added.emit(tail)
