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
			"Your village is relying on you to guide them through the winter... As I have seen so many guide this little village before you...",
			"the offerings left by generations living here has always kept the people safe, it is my hope that you will continue such traditions, for the sake of the forest, and the people who rely on it..."
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
		var stats = [GameManager.stats["village_approval"], GameManager.stats["king_approval"], GameManager.stats["deity_approval"]]
		if stats[0] > stats[1] and stats[0] > stats[2]:
			current.character = Character.JEREMY
			current.text = ["The village has had a hard winter but we made it through thanks to your hard work!"]
		elif stats[1] > stats[2]:
			current.character = Character.KING
			current.text = ["It's a shame your village didn't do so well but I'd like to offer you a new job in the capital."]
		else:
			current.character = Character.DEITY
			current.text = ["Your devotion has been rewarded, your village will be safe this winter."]
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
