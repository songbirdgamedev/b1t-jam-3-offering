extends Node


enum Character {
	JEREMY,
	KING,
	DEITY
}


class TextCharacter:
	var text: Array[String]
	var character: int
	
	func _init(t: Array[String], c: int) -> void:
		text = t
		character = c


var intro: TextCharacter 
var early: Array[TextCharacter]
var mid: Array[TextCharacter]
var late: Array[TextCharacter]
var current: TextCharacter


func _ready() -> void:
	set_text()


func set_text() -> void:
	intro = TextCharacter.new([
		GameManager.player_name + "! Congratulations on winning the election! Ready for your first day on the job?",
		"I know it's not the easiest role in the world, but the people had faith in you. I'm sure you'll do just fine.",
		"Anyway, I'll let you get to work. There's some papers on the table for you to sort through. Lots of requests from the townsfolk. I trust you'll make the right decisions."
	], 
	Character.JEREMY)
	early = [
		TextCharacter.new([
			"Hi " + GameManager.player_name + ", that decision was pretty easy I bet. I think you're up for something a bit harder.",
			"Good luck!"
		],
		Character.JEREMY),
		TextCharacter.new([
			"This is a second test dialogue for the early game.",
			"Let's see if it works."
		],
		Character.KING)
	]


func set_current(text: TextCharacter) -> void:
	current = text
