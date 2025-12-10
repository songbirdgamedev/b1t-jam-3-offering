class_name TimeLeft
extends CanvasLayer


@onready var label: RichTextLabel = $Label

var weeks: int


func set_text() -> void:
	weeks = GameManager.weeks_left
	print(weeks)
	print(str(weeks))
	if weeks == 2:
		label.text = "[shake]" + str(weeks)  + " weeks until winter..."
	elif weeks == 1:
		label.text = "[shake]" + str(weeks)  + " week until winter..."
	else:
		label.text = str(weeks) + " weeks until winter..."
	GameManager.weeks_left -= 1
