class_name TimeLeft
extends CanvasLayer


@onready var label: RichTextLabel = $Label

var weeks: int


func set_text() -> void:
	weeks = GameManager.weeks_left
	if weeks == 2:
		label.text = "[shake]" + str(weeks)  + " weeks until winter..."
	elif weeks == 1:
		label.text = "[shake]" + str(weeks)  + " week until winter..."
	else:
		print(str(weeks) + " weeks until winter...")
		label.text = str(weeks) + " weeks until winter..."
	GameManager.weeks_left -= 1
