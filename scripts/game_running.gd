extends CanvasLayer


@onready var text_box: TextBox = $Dialogue/TextBox
@onready var dialogue: Dialogue = $Dialogue
@onready var decision: Decision = $Decision
@onready var animation_player: AnimationPlayer = $AnimationPlayer


func _ready() -> void:
	# animation_player.play("start")
	
	dialogue.show_dialogue(TextManager.intro.lines, TextManager.intro.character)
	decision.visible = false


func _on_dialogue_dialogue_finished() -> void:
	animation_player.play("dialogue_to_decision")


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	match anim_name:
		"dialogue_to_decision":
			decision.set_scenario()
