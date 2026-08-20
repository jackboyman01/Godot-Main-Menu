extends Control

const MenuButtonFx = preload("res://Menu/MenuButtonFx.gd")

@onready var back_button: Button = $Center/Panel/Margin/VBox/BackButton


func _ready() -> void:
	call_deferred("_setup_button_fx")


func _setup_button_fx() -> void:
	MenuButtonFx.wire_buttons([back_button])


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("key_exit"):
		_go_back()
		get_viewport().set_input_as_handled()


func _on_back_button_pressed() -> void:
	_go_back()


func _go_back() -> void:
	$UISound.play()
	$FadeIn.show()
	$FadeIn.fade_in()


func _on_FadeIn_fade_finished() -> void:
	get_tree().change_scene_to_file("res://Menu/MainMenu.tscn")
