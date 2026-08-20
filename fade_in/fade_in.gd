extends ColorRect

signal fade_finished


func fade_in() -> void:
	$AnimationPlayer.play("fade_in")


func _on_AnimationPlayer_animation_finished(_anim_name: StringName) -> void:
	fade_finished.emit()
