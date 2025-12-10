extends Node


var early: Array[Scenario] = [
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
	])
]

var mid: Array[Scenario] = []

var late: Array[Scenario] = []


func get_scenario() -> Scenario:
	var weeks = GameManager.weeks_left
	var list: Array[Scenario]
	if weeks >= 7:
		list = early
	elif weeks >= 4:
		list = mid
	else:
		list = late
	list.shuffle()
	return list.pop_back()
