extends Node


var early: Array[Scenario]
var mid: Array[Scenario]
var late: Array[Scenario]


func _ready() -> void:
	set_scenarios()


func set_scenarios() -> void:
	early = [
		Scenario.new("Dear " + GameManager.player_name + ", we humbly request some supplies from the stores for an offering to the forest. The chill of winter will be bitter without them. -Village Elders", [
			Option.new("Give the elders a veritable bounty from the stores", {
				"village_approval": -10,
				"deity_approval": 30
			}),
			Option.new("Allow the elders to choose some food that's past its best", {
				"village_approval": -5,
				"deity_approval": 5
			}),
			Option.new("Lavish the forest shrine with offerings from your personal store", {
				"village_approval": 10,
				"deity_approval": 30
			}),
			Option.new("Tell the elders that the village needs those supplies for winter", {
				"village_approval": 20,
				"deity_approval": -20
			})
		]),
		Scenario.new("Please help! The roads into town are overgrown with brambles, we can't get any supplies in from the capital, and our merchants have no way to sell their wares. -The Merchant's Guild", [
			Option.new("Choose some villagers to clear the roads and supervise the project", {
				"village_approval": 10
			}),
			Option.new("Tell the merchants to hire someone to do the job, you're too busy", {
				"village_approval": -20
			}),
			Option.new("Send a messenger to the nearest barracks, asking the king's men for help", {
				"village_approval": 20,
				"king_approval": -10
			}),
			Option.new("Pray to the goddess of the forest to stop the brambles from growing", {
				"village_approval": -10,
				"deity_approval": 20
			})
		]),
		Scenario.new("To whom it may concern, as I'm sure you are aware, taxes will be due soon. It may be prudent to remind the people of your village of their responsibilities to their king.", [
			Option.new("Gather the people in the square and announce they must pay the tax", {
				"village_approval": -20,
				"king_approval": 30
			}),
			Option.new("Send a message back to the king asking what he means", {
				"village_approval": 10,
				"king_approval": -20
			}),
			Option.new("Send a message back explaining that your people are too poor to pay", {
				"village_approval": 20,
				"king_approval": -30
			}),
			Option.new("Gather the people and try to ensure everyone has enough to pay", {
				"village_approval": 5,
				"king_approval": 15
			})
		]),
	]

	mid = [
		Scenario.new("Dear " + GameManager.player_name + ", some of our families can't afford food with the increased taxes this year. If you can spare anything, we would appreciate it very much!", [
			Option.new("Distribute food from the stores among the poorest villagers", {
				"village_approval": 20
			}),
			Option.new("Tell the villagers to sort it out amongst themselves", {
				"village_approval": -20
			}),
			Option.new("Offer some food at the shrine and ask the goddess for help", {
				"village_approval": 5,
				"deity_approval": 30
			}),
			Option.new("Ignore the message, as resources are scarce", {
				"village_approval": -30
			})
		]),
		Scenario.new("As I'm sure you know, taxes were due three days ago, and I'm still missing some contributions from your village. I trust you know your duty here.", [
			Option.new("Go after everyone who has not paid and demand they do so", {
				"village_approval": -30,
				"king_approval": 30
			}),
			Option.new("Attempt to pay the remaining balance from your personal coin", {
				"village_approval": 10,
				"king_approval": 10
			}),
			Option.new("Ignore the missive entirely", {
				"village_approval": 10,
				"king_approval": -20
			}),
			Option.new("Send a message telling the king your people have paid enough", {
				"village_approval": 20,
				"king_approval": -30
			})
		]),
		Scenario.new("Dear " + GameManager.player_name + ", we would like to hold a ceremony in the square to honour the forest goddess. We ask your permission, and perhaps your blessing? -Village Elders", [
			Option.new("Tell them no", {
				"village_approval": -10,
				"deity_approval": -20
			}),
			Option.new("Allow the ceremony but discourage people from attending", {
				"village_approval": -5,
				"deity_approval": -15
			}),
			Option.new("Encourage the whole village to attend the ceremony", {
				"village_approval": 5,
				"deity_approval": 20
			}),
			Option.new("Attend the ceremony yourself and bring a personal offering", {
				"village_approval": 10,
				"deity_approval": 30
			})
		]),
	]

	late = [
		Scenario.new("I have heard rumours of old god worship among the people of your village. This will not stand in my kingdom! You are to ban such practices immediately.", [
			Option.new("Announce that worship of the forest goddess is now banned", {
				"village_approval": -20,
				"deity_approval": -30,
				"king_approval": 30
			}),
			Option.new("Ignore the king's missive", {
				"deity_approval": 20,
				"king_approval": -20
			}),
			Option.new("Gather more offerings for the forest goddess", {
				"deity_approval": 30,
				"king_approval": -30
			}),
			Option.new("Tell the villagers to keep their worship quiet", {
				"village_approval": 10,
				"deity_approval": 10
			})
		]),
		Scenario.new("A merchant is passing through. He claims to have potions that will warm us all through the winter. He's offering a great deal on bulk orders!", [
			Option.new("Spend all of the village's remaining funds on potions", {
				"village_approval": -30
			}),
			Option.new("Assure the villagers that the merchant is only selling lies", {
				"village_approval": -5
			}),
			Option.new("Buy a small number, just in case", {
				"village_approval": 10
			}),
			Option.new("Find the merchant and chase him out of town with a broom", {
				"village_approval": 20
			})
		]),
		Scenario.new("I can grant you protection through the winter, if you are willing to put your trust in me. One last offering is all I ask. -????", [
			Option.new("Ignore the strange message", {
				"deity_approval": -10
			}),
			Option.new("Hold another ceremony in the village square", {
				"deity_approval": 20,
				"village_approval": 10
			}),
			Option.new("Don't mention it to the villagers but make a private offering", {
				"deity_approval": 30
			}),
			Option.new("Remind the villagers that old god worship is considered treason", {
				"deity_approval": -30,
				"village_approval": -10
			})
		]),
	]


func get_scenario() -> Scenario:
	var weeks = GameManager.weeks_left
	var list: Array[Scenario]
	if weeks >= 2:
		list = early
	elif weeks >= 1:
		list = mid
	else:
		list = late
	list.shuffle()
	return list.pop_back()
