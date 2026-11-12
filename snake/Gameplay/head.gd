class_name Head
extends SnakePart
signal food_eaten
func _on_head_area_entered(area: Area2D) -> void:
	if area.is_in_group("food"):
		# collided with food
		area.call_deferred("queue_free")
		food_eaten.emit()
	else:
		# collided with something that isn't food
		pass
