extends Node


func prompt_name() -> void:
	get_tree().change_scene_to_file("res://scenes/name_prompt.tscn")


func start_game() -> void:
	get_tree().change_scene_to_file("res://scenes/game_running.tscn")


func game_over() -> void:
	get_tree().change_scene_to_file("res://scenes/game_over.tscn")


func options_menu() -> void:
	# [TODO] implement once options menu exists
	pass


func restart_game() -> void:
	get_tree().change_scene_to_file("res://scenes/title_screen.tscn")
