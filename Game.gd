extends Node2D

var escape_pressed_time = 0.0
var escape_hold_duration = 2.0
var escape_held = false

func _ready():
	set_process(true)
	MusicManager.playGameMusic()

func _process(delta):
	if Input.is_action_pressed("key_exit"):
		escape_pressed_time += delta
		$QuitLabel.visible = true  # Show the label when holding the escape key
		if escape_pressed_time >= escape_hold_duration:
			escape_held = true
			$FadeIn.show()
			$FadeIn.fade_in()
	else:
		if escape_pressed_time > 0 and !escape_held:
			# If the escape key was released before the hold duration, reset the timer
			escape_pressed_time = 0.0
			escape_held = false
			$QuitLabel.visible = false  # Hide the label when not holding the escape key

func _on_FadeIn_fade_finished():
	if escape_held:
		get_tree().change_scene_to_file("res://Menu/MainMenu.tscn")
