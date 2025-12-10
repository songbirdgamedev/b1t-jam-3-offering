extends Node


@onready var music: AudioStreamPlayer = $Music


func play_music() -> void:
	music.play()


func stop_music() -> void:
	music.stop()
