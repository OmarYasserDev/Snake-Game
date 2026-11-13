class_name StartScreen extends CanvasLayer
const gameplay_scene:PackedScene = preload("res://gameplay/gameplay.tscn")
@onready var score: Label = %ScoreLabel
@onready var start: Button = %StartButton
@onready var quit: Button = %QuitButton
func _ready() -> void:
	var high_score:int = 0
	score.text = "High Score: " + str(high_score)
func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_packed(gameplay_scene)
func _on_quit_button_pressed() -> void:
	get_tree().quit()
