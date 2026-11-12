class_name Spawner
extends Node2D

@export var bounds: Bounds
@export var grid_size: int = 32

func spawn_food() -> void:
	var spawn_point: Vector2 = Vector2.ZERO
	var food_scene: PackedScene = preload("res://Gameplay/food.tscn")

	spawn_point.x = randf_range(
		bounds.x_min + grid_size,
		bounds.x_max - grid_size
	)

	spawn_point.y = randf_range(
		bounds.y_min + grid_size,
		bounds.y_max - grid_size
	)

	spawn_point.x = floor(spawn_point.x / grid_size) * grid_size
	spawn_point.y = floor(spawn_point.y / grid_size) * grid_size

	var food = food_scene.instantiate()
	food.position = spawn_point

	get_parent().add_child(food)
