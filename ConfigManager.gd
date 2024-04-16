extends Node

var musicVolume = 0.0
var gameVolume = 0.0

# Singleton instance
func _ready():
	if not Engine.has_singleton("ConfigManager"):
		Engine.register_singleton("ConfigManager", self)

var config = ConfigFile.new()

func load_audio_volumes():
	if config.load("user://audio_volumes.cfg") == OK:
		musicVolume = config.get_value("volume", "music", musicVolume)
		gameVolume = config.get_value("volume", "game", gameVolume)
		# Set the loaded audio volumes
		AudioServer.set_bus_volume_db(1, musicVolume)
		if musicVolume == -30: 
			AudioServer.set_bus_mute(1, true) 
		else: 
			AudioServer.set_bus_mute(1, false)
		AudioServer.set_bus_volume_db(2, gameVolume)
		if gameVolume == -30: 
			AudioServer.set_bus_mute(2, true) 
		else: 
			AudioServer.set_bus_mute(2, false)

func save_audio_volumes():
	config.set_value("volume", "music", musicVolume)
	config.set_value("volume", "game", gameVolume)
	config.save("user://audio_volumes.cfg")
