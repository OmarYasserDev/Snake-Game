class_name Head
extends SnakePart

signal food_eaten

func _ready() -> void:
	if not area_entered.is_connected(_on_head_area_entered):
		area_entered.connect(_on_head_area_entered)

	print("Head is ready!")

func _on_head_area_entered(area: Area2D) -> void:
	print("Collision detected with: ", area.name)

	if area.is_in_group("food"):
		print("FOOD COLLECTED!")
		area.queue_free()
		food_eaten.emit()
	else:
		pass
