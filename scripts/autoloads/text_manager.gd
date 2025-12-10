extends Node


enum Character {
	JEREMY,
	KING,
	DEITY
}


class TextCharacter:
	var lines: Array[String]
	var character: int


var intro: TextCharacter = TextCharacter.new()
var early: Array[TextCharacter]
var mid: Array[TextCharacter]
var late: Array[TextCharacter]
var current: TextCharacter


func _ready() -> void:
	set_text()


func set_text() -> void:
	intro.lines = [
		GameManager.player_name + "! Congratulations on winning the election! Ready for your first day on the job?",
		"I know it's not the easiest role in the world, but the people had faith in you. I'm sure you'll do just fine.",
		"Anyway, I'll let you get to work. There's some papers on the table for you to sort through. Lots of requests from the townsfolk. I trust you'll make the right decisions."
	]
	intro.character = Character.KING


func set_current(text: TextCharacter) -> void:
	current = text
