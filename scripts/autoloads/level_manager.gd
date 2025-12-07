extends Node


func start_game():
	get_tree().change_scene_to_file("res://scenes/game_running.tscn")


func game_over():
	get_tree().change_scene_to_file("res://scenes/game_over.tscn")


func options_menu():
	# [TODO] implement once options menu exists
	pass


func restart_game():
	get_tree().change_scene_to_file("res://scenes/title_screen.tscn")
