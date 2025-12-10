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


func change_name(name: String) -> void:
	player_name = name
	TextManager.set_text()
