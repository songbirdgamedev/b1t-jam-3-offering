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
				"village_approval": 5
			}),
			Option.new("allow the elders to choose plenty from the best of the supplies", {
				"village_approval": -1
			}),
			Option.new("Allow the elders to choose some food that's past its best", {
				"village_approval": 50
			}),
			Option.new("Allow the elders to choose a small amount from the supplies", {
				"village_approval": -10
			}),
			Option.new("Ignore the elders' request entirely", {
				"village_approval": 10
			}),
			Option.new("Tell the elders that the village needs those supplies for winter", {
				"village_approval": 55
			})
		]),
		Scenario.new("You need to test a scenaritwo!", [
			Option.new("test one", {
				"village_approval": 5
			}),
			Option.new("test two", {
				"village_approval": -1
			}),
			Option.new("test three", {
				"village_approval": 50
			}),
			Option.new("test four", {
				"village_approval": -10
			}),
			Option.new("test five", {
				"village_approval": 10
			}),
			Option.new("test six", {
				"village_approval": 55
			})
		]),
		Scenario.new("You need to test a scenario 3!", [
			Option.new("test one", {
				"village_approval": 5
			}),
			Option.new("test two", {
				"village_approval": -1
			}),
			Option.new("test three", {
				"village_approval": 50
			}),
			Option.new("test four", {
				"village_approval": -10
			}),
			Option.new("test five", {
				"village_approval": 10
			}),
			Option.new("test six", {
				"village_approval": 55
			})
		]),
	]

	mid = [
		Scenario.new("You need to test a scenario!", [
			Option.new("test one", {
				"village_approval": 5
			}),
			Option.new("test two", {
				"village_approval": -1
			}),
			Option.new("test three", {
				"village_approval": 50
			}),
			Option.new("test four", {
				"village_approval": -10
			}),
			Option.new("test five", {
				"village_approval": 10
			}),
			Option.new("test six", {
				"village_approval": 55
			})
		]),
		Scenario.new("You need to test a scenaritwo!", [
			Option.new("test one", {
				"village_approval": 5
			}),
			Option.new("test two", {
				"village_approval": -1
			}),
			Option.new("test three", {
				"village_approval": 50
			}),
			Option.new("test four", {
				"village_approval": -10
			}),
			Option.new("test five", {
				"village_approval": 10
			}),
			Option.new("test six", {
				"village_approval": 55
			})
		]),
		Scenario.new("You need to test a scenario 3!", [
			Option.new("test one", {
				"village_approval": 5
			}),
			Option.new("test two", {
				"village_approval": -1
			}),
			Option.new("test three", {
				"village_approval": 50
			}),
			Option.new("test four", {
				"village_approval": -10
			}),
			Option.new("test five", {
				"village_approval": 10
			}),
			Option.new("test six", {
				"village_approval": 55
			})
		]),
	]

	late = [
		Scenario.new("You need to test a scenario!", [
			Option.new("test one", {
				"village_approval": 5
			}),
			Option.new("test two", {
				"village_approval": -1
			}),
			Option.new("test three", {
				"village_approval": 50
			}),
			Option.new("test four", {
				"village_approval": -10
			}),
			Option.new("test five", {
				"village_approval": 10
			}),
			Option.new("test six", {
				"village_approval": 55
			})
		]),
		Scenario.new("You need to test a scenaritwo!", [
			Option.new("test one", {
				"village_approval": 5
			}),
			Option.new("test two", {
				"village_approval": -1
			}),
			Option.new("test three", {
				"village_approval": 50
			}),
			Option.new("test four", {
				"village_approval": -10
			}),
			Option.new("test five", {
				"village_approval": 10
			}),
			Option.new("test six", {
				"village_approval": 55
			})
		]),
		Scenario.new("You need to test a scenario 3!", [
			Option.new("test one", {
				"village_approval": 5
			}),
			Option.new("test two", {
				"village_approval": -1
			}),
			Option.new("test three", {
				"village_approval": 50
			}),
			Option.new("test four", {
				"village_approval": -10
			}),
			Option.new("test five", {
				"village_approval": 10
			}),
			Option.new("test six", {
				"village_approval": 55
			})
		]),
	]


func get_scenario() -> Scenario:
	var weeks = GameManager.weeks_left
	var list: Array[Scenario]
	if weeks >= 6:
		list = early
	elif weeks >= 3:
		list = mid
	else:
		list = late
	list.shuffle()
	return list.pop_back()
