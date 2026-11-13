class_name Tail
extends SnakePart

@export var textures: Array[Texture2D]
@onready var sprite_2d: Sprite2D = $Sprite2D
func _ready() -> void:
	if not textures.is_empty():
		sprite_2d.texture = textures.pick_random()
