extends Node

var menu_music = load("")
var game_music = load("")
var menu_music_play = false
var game_music_play = false

func _ready():
	pass

func play_menu_music():
	$Music.stream = menu_music
	$Music.set_volume_db(0)
	$Music.play()
	menu_music_play = true
	game_music_play = false

func play_game_music():
	$Music.stream = game_music
	$Music.set_volume_db(-20)
	$Music.play()
	menu_music_play = false
