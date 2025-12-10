class_name DecisionButton
extends Node2D


@onready var button: Button = $ColorRect/Button
var result: Dictionary

signal button_pressed


func set_option(option: Option) -> void:
	button.text = option.text
	result = option.result


func _on_button_pressed() -> void:
	for key in result.keys():
		GameManager.stats[key] += result[key]

	button_pressed.emit()
