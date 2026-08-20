extends Control

const MenuButtonFx = preload("res://Menu/MenuButtonFx.gd")

var scene_path_to_load: String

@onready var _buttons: Array[BaseButton] = [
	$Center/Panel/Margin/VBox/Buttons/StartButton,
	$Center/Panel/Margin/VBox/Buttons/OptionsButton,
	$Center/Panel/Margin/VBox/Buttons/CreditsButton,
	$Center/Panel/Margin/VBox/Buttons/ExitButton,
]


func _ready() -> void:
	if ConfigManager.load_fullscreen_setting():
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	MusicManager.playMainMenuMusic()
	ConfigManager.load_audio_volumes()
	# Defer so container layout has settled before caching rest positions.
	call_deferred("_setup_button_fx")


func _setup_button_fx() -> void:
	MenuButtonFx.wire_buttons(_buttons)


func _on_start_button_pressed() -> void:
	scene_path_to_load = "res://Game.tscn"
	_transition()


func _on_options_button_pressed() -> void:
	scene_path_to_load = "res://Menu/Options.tscn"
	_transition()


func _on_credits_button_pressed() -> void:
	scene_path_to_load = "res://Menu/Credits.tscn"
	_transition()


func _on_exit_button_pressed() -> void:
	$UISound.play()
	$Center.hide()
	$Background.hide()
	await get_tree().create_timer(0.6).timeout
	get_tree().quit()


func _transition() -> void:
	$UISound.play()
	$FadeIn.show()
	$FadeIn.fade_in()


func _on_FadeIn_fade_finished() -> void:
	get_tree().change_scene_to_file(scene_path_to_load)


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("key_exit"):
		get_tree().quit()
