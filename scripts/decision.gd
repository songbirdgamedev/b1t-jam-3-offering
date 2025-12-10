class_name Decision
extends CanvasLayer


@onready var text_box: TextBox = $TextBox
@onready var buttons: Node2D = $Buttons

var scenario: Scenario

signal decision_made


func set_prompt(text: String) -> void:
	text_box.queue_text(text)


func set_options(options: Array[Option]) -> void:
	options.shuffle()
	for i in len(buttons.get_children()):
		buttons.get_child(i).set_option(options[i])


func set_scenario() -> void:
	scenario = ScenarioManager.get_scenario()
	set_options(scenario.options)
	set_prompt(scenario.text)


func _on_text_box_text_finished() -> void:
	buttons.show()
	text_box.process_mode = Node.PROCESS_MODE_DISABLED


func _on_decision_button_pressed() -> void:
	decision_made.emit()
	text_box.process_mode = Node.PROCESS_MODE_ALWAYS
	buttons.hide()
