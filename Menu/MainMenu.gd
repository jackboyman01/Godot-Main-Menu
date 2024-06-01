extends Control

var scene_path_to_load

func _ready():
	set_process_input(true)
	if ConfigManager.load_fullscreen_setting():
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	MusicManager.playMainMenuMusic()
	ConfigManager.load_audio_volumes()

func _on_start_button_pressed():
	scene_path_to_load = "res://Game.tscn"
	on_Button_pressed()

func _on_options_button_pressed():
	scene_path_to_load = "res://Menu/Options.tscn"
	on_Button_pressed()

func _on_credits_button_pressed():
	scene_path_to_load = "res://Menu/Credits.tscn"
	on_Button_pressed()

func _on_exit_button_pressed():
	$UISound.play()
	$Menu.hide()
	$background.hide()
	await get_tree().create_timer(1.0).timeout
	get_tree().quit()

func on_Button_pressed():
	$UISound.play()
	$FadeIn.show()
	$FadeIn.fade_in()

func _on_FadeIn_fade_finished():
	get_tree().change_scene_to_file(scene_path_to_load)

func _input(event):
	if event.is_action_pressed("key_exit"):
		get_tree().quit()
