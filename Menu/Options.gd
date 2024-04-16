extends Control

var config = ConfigFile.new()
var musicVolume = 0.0
var gameVolume = 0.0

# Add references to your sliders
@onready var musicSlider = $VBoxContainer/Music_Slider
@onready var gameSlider = $VBoxContainer/Game_Slider

func _on_back_button_pressed():
	$UISound.play()
	$FadeIn.show()
	$FadeIn.fade_in()

func _on_CheckBox_pressed():
	$UISound.play()
	get_window().mode = Window.MODE_EXCLUSIVE_FULLSCREEN if (!((get_window().mode == Window.MODE_EXCLUSIVE_FULLSCREEN) or (get_window().mode == Window.MODE_FULLSCREEN))) else Window.MODE_WINDOWED

func _on_FadeIn_fade_finished():
	get_tree().change_scene_to_file("res://Menu/MainMenu.tscn")

func _ready():
	set_process(true)
	ConfigManager.load_audio_volumes() # Load saved audio volumes when the game starts
	# Set initial values for the sliders
	musicSlider.value = ConfigManager.musicVolume
	gameSlider.value = ConfigManager.gameVolume

func _process(_delta):
	if Input.is_action_pressed("key_exit"):
		$FadeIn.show()
		$FadeIn.fade_in()

func _on_Music_Slider_value_changed(value):
	AudioServer.set_bus_volume_db(1, lerp(AudioServer.get_bus_volume_db(1), value, 0.5))
	musicVolume = value
	ConfigManager.musicVolume = value
	if musicVolume == -30: 
		AudioServer.set_bus_mute(1, true) 
	else: 
		AudioServer.set_bus_mute(1, false)
	ConfigManager.save_audio_volumes() # Save the current audio volumes

func _on_Game_Slider_value_changed(value):
	AudioServer.set_bus_volume_db(2, lerp(AudioServer.get_bus_volume_db(2), value, 0.5))
	gameVolume = value
	ConfigManager.gameVolume = value
	if gameVolume == -30: 
		AudioServer.set_bus_mute(2, true) 
	else: 
		AudioServer.set_bus_mute(2, false)
	ConfigManager.save_audio_volumes() # Save the current audio volumes
