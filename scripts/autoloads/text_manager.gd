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
var end: TextCharacter
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
	mid = [
		TextCharacter.new([
			"Ho there, lowly villager! I am your king. I have come to see the person in charge around here.",
			"Oh... that's you, is it? I rather expected someone more... put together, perhaps somebody who had taken a bath in the past six months.",
		],
		Character.KING)
	]
	late = [
		TextCharacter.new([
			GameManager.player_name + "... I know you can hear me.",
		],
		Character.DEITY)
	]
	end = TextCharacter.new([
		"Thanks for playing, " + GameManager.player_name,
	],
	Character.DEITY)


func set_current() -> void:
	var weeks = GameManager.weeks_left
	var list: Array[TextCharacter]
	if weeks < 0:
		current = end
		return
	if weeks >= 1:
		list = mid
	elif weeks >= 0:
		list = late
	else:
		list = [intro]
	list.shuffle()
	current =  list.pop_back()


func get_text() -> Array[String]:
	return current.text


func get_character() -> int:
	return current.character
