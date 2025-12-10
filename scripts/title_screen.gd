extends Node2D


func _on_play_button_pressed() -> void:
	AudioManager.play_music()
	LevelManager.prompt_name()
