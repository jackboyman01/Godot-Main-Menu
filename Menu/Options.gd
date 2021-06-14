extends Control

func _on_Button_pressed():
	$UISound.play()
	$FadeIn.show()
	$FadeIn.fade_in()

func _on_FadeIn_fade_finished():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Menu/Main Menu.tscn")

func _ready():
	set_process(true)
	$"VBoxContainer/HBoxContainer1/Music_Slider".grab_focus()
	$"VBoxContainer/HBoxContainer1/Music_Slider".set_value(AudioServer.get_bus_volume_db(1))
	$"VBoxContainer/HBoxContainer2/Game_Slider".set_value(AudioServer.get_bus_volume_db(2))

func _process(_delta):
	if Input.is_action_pressed("ui_cancel"):
		$FadeIn.show()
		$FadeIn.fade_in()

func _on_Music_Slider_value_changed(value):
	AudioServer.set_bus_volume_db(1, lerp(AudioServer.get_bus_volume_db(1), value, 0.5))
	if value == -30:
		AudioServer.set_bus_mute(1, true)
	else:
		AudioServer.set_bus_mute(1, false)

func _on_Game_Slider_value_changed(value):
	AudioServer.set_bus_volume_db(2, lerp(AudioServer.get_bus_volume_db(2), value, 0.5))
	if value == -30:
		AudioServer.set_bus_mute(2, true)
	else:
		AudioServer.set_bus_mute(2, false)
