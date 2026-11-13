class_name Gameplay
extends Node2D

@onready var Head_snake: Head = %Head
@onready var bounds: Bounds = $Bounds
@onready var spawner: Spawner = %Spawner

var snake_parts: Array[SnakePart] = []
var time_between_moves: float = 0.2
var time_since_last_moves: float = 0.0
var move_dir: Vector2 = Vector2.RIGHT

const GRID_SIZE: int = 32


func _ready() -> void:
	snake_parts.append(Head_snake)

	spawner.bounds = bounds

	Head_snake.food_eaten.connect(_on_food_eaten)
	Head_snake.collided_with_tail.connect(_on_tail_collided)
	spawner.tail_added.connect(_on_tail_added)

	spawner.spawn_food()


func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_up") and move_dir != Vector2.DOWN:
		move_dir = Vector2.UP
	elif Input.is_action_just_pressed("ui_right") and move_dir != Vector2.LEFT:
		move_dir = Vector2.RIGHT
	elif Input.is_action_just_pressed("ui_left") and move_dir != Vector2.RIGHT:
		move_dir = Vector2.LEFT
	elif Input.is_action_just_pressed("ui_down") and move_dir != Vector2.UP:
		move_dir = Vector2.DOWN


func _physics_process(delta: float) -> void:
	time_since_last_moves += delta

	if time_since_last_moves >= time_between_moves:
		update_snake()
		time_since_last_moves -= time_between_moves


func update_snake() -> void:
	var new_pos: Vector2 = bounds.wrap_vector(
		Head_snake.position + move_dir * GRID_SIZE
	)

	for i in range(snake_parts.size() - 1, 0, -1):
		snake_parts[i].move_to(snake_parts[i - 1].position)

	Head_snake.move_to(new_pos)


func _on_food_eaten() -> void:
	print("Food eaten!")
	var last_part: SnakePart = snake_parts[snake_parts.size() - 1]
	spawner.call_deferred("spawn_food")
	spawner.call_deferred("spawn_tail", last_part.last_position)
	time_between_moves = maxf(0.12, time_between_moves - 0.002)

func _on_tail_added(tail: Tail) -> void:
	snake_parts.append(tail)
	print("Snake length: ", snake_parts.size())


func _on_tail_collided() -> void:
	print("GAME OVER! You collided with your tail.")
