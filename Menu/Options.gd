extends Control

const MenuButtonFx = preload("res://Menu/MenuButtonFx.gd")

@onready var master_slider: HSlider = $Center/Panel/Margin/VBox/MasterSlider
@onready var music_slider: HSlider = $Center/Panel/Margin/VBox/MusicSlider
@onready var sfx_slider: HSlider = $Center/Panel/Margin/VBox/SfxSlider
@onready var fullscreen_btn: CheckButton = $Center/Panel/Margin/VBox/FullscreenRow/FullscreenCheck
@onready var back_button: Button = $Center/Panel/Margin/VBox/BackButton


func _ready() -> void:
	ConfigManager.load_audio_volumes()
	ConfigManager.load_fullscreen_setting()
	for control in [master_slider, music_slider, sfx_slider, fullscreen_btn]:
		control.set_block_signals(true)
	master_slider.value = ConfigManager.master_volume
	music_slider.value = ConfigManager.music_volume
	sfx_slider.value = ConfigManager.game_volume
	fullscreen_btn.button_pressed = ConfigManager.fullscreen_enabled
	for control in [master_slider, music_slider, sfx_slider, fullscreen_btn]:
		control.set_block_signals(false)
	call_deferred("_setup_button_fx")


func _setup_button_fx() -> void:
	MenuButtonFx.wire_buttons([back_button, fullscreen_btn])


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


func _on_fullscreen_toggled(pressed: bool) -> void:
	$UISound.play()
	ConfigManager.apply_fullscreen(pressed)


func _on_master_slider_value_changed(value: float) -> void:
	ConfigManager.set_master_volume(value)


func _on_music_slider_value_changed(value: float) -> void:
	ConfigManager.set_music_volume(value)


func _on_sfx_slider_value_changed(value: float) -> void:
	ConfigManager.set_game_volume(value)
