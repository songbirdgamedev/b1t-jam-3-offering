extends CanvasLayer


@onready var name_input: LineEdit = $NameInput


func _name_submitted() -> void:
	if not name_input.text == "":
		GameManager.change_name(name_input.text)
	LevelManager.start_game()


func _on_button_pressed() -> void:
	_name_submitted()


func _on_name_input_text_submitted(new_text: String) -> void:
	_name_submitted()
