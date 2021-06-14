extends Control

var scene_path_to_load

func _ready():
	if !MusicPlayer.menu_music_play:
		MusicPlayer.play_menu_music()
	set_process(true)
	if !OS.window_fullscreen:
		OS.window_fullscreen = !OS.window_fullscreen
	$"Menu/CenterRow/Buttons/Start Game".grab_focus()
	for button in $Menu/CenterRow/Buttons.get_children():
		button.connect("pressed", self, "_on_Button_pressed", [button.scene_to_load])

func _on_Button_pressed(scene_to_load):
	scene_path_to_load = scene_to_load
	$UISound.play()
	$FadeIn.show()
	$FadeIn.fade_in()

func _on_FadeIn_fade_finished():
# warning-ignore:return_value_discarded
	get_tree().change_scene(scene_path_to_load)

func _process(_delta):
	if Input.is_action_pressed("ui_cancel"):
		$UISound.play()
		get_tree().quit()
