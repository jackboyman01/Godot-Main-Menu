extends Node

var master_volume := 0.0
var music_volume := 0.0
var game_volume := 0.0
var fullscreen_enabled := false

const AUDIO_PATH := "user://audio_volumes.cfg"
const CONFIG_PATH := "user://config.cfg"
const MUTE_FLOOR := -30.0

const BUS_MASTER := 0
const BUS_MUSIC := 1
const BUS_GAME := 2


func _ready() -> void:
	load_audio_volumes()
	load_fullscreen_setting()


func apply_bus_volume(bus_idx: int, value: float) -> void:
	AudioServer.set_bus_volume_db(bus_idx, value)
	AudioServer.set_bus_mute(bus_idx, value <= MUTE_FLOOR)


func load_audio_volumes() -> void:
	var config := ConfigFile.new()
	if config.load(AUDIO_PATH) == OK:
		master_volume = float(config.get_value("volume", "master", master_volume))
		music_volume = float(config.get_value("volume", "music", music_volume))
		game_volume = float(config.get_value("volume", "game", game_volume))
	apply_bus_volume(BUS_MASTER, master_volume)
	apply_bus_volume(BUS_MUSIC, music_volume)
	apply_bus_volume(BUS_GAME, game_volume)


func save_audio_volumes() -> void:
	var config := ConfigFile.new()
	config.load(AUDIO_PATH)
	config.set_value("volume", "master", master_volume)
	config.set_value("volume", "music", music_volume)
	config.set_value("volume", "game", game_volume)
	config.save(AUDIO_PATH)


func set_master_volume(value: float) -> void:
	master_volume = value
	apply_bus_volume(BUS_MASTER, value)
	save_audio_volumes()


func set_music_volume(value: float) -> void:
	music_volume = value
	apply_bus_volume(BUS_MUSIC, value)
	save_audio_volumes()


func set_game_volume(value: float) -> void:
	game_volume = value
	apply_bus_volume(BUS_GAME, value)
	save_audio_volumes()


func load_fullscreen_setting() -> bool:
	var config := ConfigFile.new()
	if config.load(CONFIG_PATH) == OK and config.has_section_key("settings", "fullscreen_enabled"):
		fullscreen_enabled = bool(config.get_value("settings", "fullscreen_enabled"))
		return fullscreen_enabled
	fullscreen_enabled = false
	return false


func save_fullscreen_setting(enabled: bool) -> void:
	fullscreen_enabled = enabled
	var config := ConfigFile.new()
	config.load(CONFIG_PATH)
	config.set_value("settings", "fullscreen_enabled", enabled)
	config.save(CONFIG_PATH)


func apply_fullscreen(enabled: bool) -> void:
	if enabled:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	save_fullscreen_setting(enabled)
