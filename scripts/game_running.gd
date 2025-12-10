extends CanvasLayer


@onready var text_box: TextBox = $Dialogue/TextBox
@onready var dialogue: Dialogue = $Dialogue
@onready var decision: Decision = $Decision
@onready var time_left: TimeLeft = $TimeLeft
@onready var animation_player: AnimationPlayer = $AnimationPlayer


func _ready() -> void:
	decision.visible = false
	dialogue.visible = false
	time_left.visible = false
	time_left.set_text()
	animation_player.play("start")
	await animation_player.animation_finished
	dialogue.show_dialogue(TextManager.intro.text, TextManager.intro.character)


func _on_dialogue_dialogue_finished() -> void:
	if GameManager.weeks_left < 0:
		end_game()
	else:
		animation_player.play("dialogue_to_decision")


func end_game() -> void:
	LevelManager.restart_game()


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	match anim_name:
		"dialogue_to_decision":
			decision.set_scenario()


func _on_decision_decision_made() -> void:
	time_left.set_text()
	TextManager.set_current()
	animation_player.play("decision_to_dialogue")
	await animation_player.animation_finished
	dialogue.show_dialogue(TextManager.get_text(), TextManager.get_character())
