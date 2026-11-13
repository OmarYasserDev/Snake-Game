class_name GameOver extends CanvasLayer

@onready var score: Label = %Score
@onready var high_score: Label = %HighScore
@onready var restartbutton: Button = %Restartbutton
@onready var quit_button: Button = %QuitButton

func set_score(n: int):
	score.text = "Final score " + str(n)

func _on_restartbutton_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()

func _on_quit_button_pressed() -> void:
	get_tree().quit()

func _notification(what):
	match what:
		NOTIFICATION_ENTER_TREE:
			get_tree().paused = true
		NOTIFICATION_EXIT_TREE:
			get_tree().paused = false
			
