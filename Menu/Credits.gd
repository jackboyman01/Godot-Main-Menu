extends Control

func _ready():
	set_process(true)

func _process(_delta):
	if Input.is_action_pressed("key_exit"):
		$FadeIn.show()
		$FadeIn.fade_in()

func _on_FadeIn_fade_finished():
	get_tree().change_scene_to_file("res://Menu/MainMenu.tscn")

func _on_back_button_pressed():
	$UISound.play()
	$FadeIn.show()
	$FadeIn.fade_in()
