extends RefCounted

const HOVER_SCALE := Vector2(1.04, 1.04)
const TWEEN_TIME := 0.14


static func wire_buttons(buttons: Array) -> void:
	for button in buttons:
		if button is BaseButton:
			_wire_one(button as BaseButton)


static func _wire_one(button: BaseButton) -> void:
	if button.get_meta("menu_fx_wired", false):
		return
	button.set_meta("menu_fx_wired", true)
	button.resized.connect(func(): _update_pivot(button))
	_update_pivot(button)
	button.mouse_entered.connect(_animate.bind(button, true))
	button.mouse_exited.connect(_animate.bind(button, false))
	button.focus_entered.connect(_animate.bind(button, true))
	button.focus_exited.connect(_animate.bind(button, false))


static func _update_pivot(button: BaseButton) -> void:
	# Grow from the left so hover reads as a soft slide-in.
	button.pivot_offset = Vector2(0.0, button.size.y * 0.5)


static func _animate(button: BaseButton, hovering: bool) -> void:
	_update_pivot(button)
	var target_scale := HOVER_SCALE if hovering else Vector2.ONE
	var target_mod := Color(1.08, 1.08, 1.08, 1.0) if hovering else Color.WHITE
	var tween := button.create_tween()
	tween.set_parallel(true)
	tween.tween_property(button, "scale", target_scale, TWEEN_TIME).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	tween.tween_property(button, "modulate", target_mod, TWEEN_TIME)
