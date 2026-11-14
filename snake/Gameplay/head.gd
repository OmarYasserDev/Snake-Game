class_name Head
extends SnakePart
signal food_eaten(score_value: int)
signal collided_with_tail
func _ready() -> void:
	if not area_entered.is_connected(_on_head_area_entered):
		area_entered.connect(_on_head_area_entered)
	print("Head is ready!")
func _on_head_area_entered(area: Area2D) -> void:
	if area is Food:
		print("FOOD COLLECTED!")
		area.queue_free()
		food_eaten.emit(area.score_value)
	else:
		collided_with_tail.emit()
