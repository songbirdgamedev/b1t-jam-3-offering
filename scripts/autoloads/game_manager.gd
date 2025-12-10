extends Node


var player_name: String = "Binglemann"
var stats: Dictionary = {
	"food": 100,
	"money": 100,
	"village_approval": 50,
	"king_approval": 20,
	"deity_approval": 30,
	"winter_intensity": 50
}
var weeks_left: int = 9
var prev_stats: Dictionary


func _ready() -> void:
	prev_stats = stats


func change_name(n: String) -> void:
	player_name = n
	TextManager.set_text()
	ScenarioManager.set_scenarios()


func calculate_winter() -> void:
	stats["winter_intensity"] = stats["deity_approval"] * 2 + stats["king_approval"] + stats["village_approval"] / 4
