extends ColorRect

signal fade_finished

func fade_in():
	$AnimationPlayer.play("fade_in")

func _on_AnimationPlayer_animation_finished(_anim_name):
	emit_signal("fade_finished")

func _on_fade_in_fade_finished():
	pass # Replace with function body.
