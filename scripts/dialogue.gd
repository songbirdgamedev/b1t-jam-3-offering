class_name Dialogue
extends CanvasLayer


@onready var text_box: TextBox = $TextBox
@onready var requester: AnimatedSprite2D = $Requester


enum Character {
	JEREMY,
	KING,
	DEITY
}


signal dialogue_finished


func show_dialogue(lines: Array[String], speaker: int) -> void:
	match speaker:
		Character.JEREMY:
			requester.play("jeremy")
		Character.KING:
			requester.play("king")
		Character.DEITY:
			requester.play("deity")
	requester.show()
	for line in lines:
		text_box.queue_text(line)


func _on_text_box_textbox_closed() -> void:
	requester.hide()
	dialogue_finished.emit()


func _on_text_box_text_finished() -> void:
	requester.stop()


func _on_text_box_reading() -> void:
	requester.play()
