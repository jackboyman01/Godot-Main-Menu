extends Node2D

func _ready():
	if !MusicPlayer.game_music_play:
		MusicPlayer.play_game_music()

func _on_FadeIn_fade_finished():
	pass # Replace with function body.

func _process(_delta):
	if Input.is_action_pressed("ui_cancel"):
		$UISound.play()
# warning-ignore:return_value_discarded
		get_tree().change_scene("res://Menu/Main Menu.tscn")
