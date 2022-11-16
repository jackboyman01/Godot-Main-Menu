extends Node

#var mainmenu_music = load("res://Sound/MainMenu.wav")
#var game_music = load("res://Sound/Game.wav")
var mainmenu_music_playing
var game_music_playing

func play_mainmenu_music():
	#$Music.stream = mainmenu_music
	$Music.play()
	mainmenu_music_playing = true
	game_music_playing = false

func play_game_music():
	#$Music.stream = game_music
	$Music.play()
	game_music_playing = true
	mainmenu_music_playing = false
