class_name Dialogue
extends CanvasLayer


@onready var text_box: TextBox = $TextBox

signal dialogue_finished


func show_dialogue(lines: Array[String]) -> void:
	for line in lines:
		text_box.queue_text(line)


func _on_text_box_textbox_closed() -> void:
	dialogue_finished.emit()
