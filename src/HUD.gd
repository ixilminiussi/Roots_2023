extends CanvasLayer

signal start_game

func _process(delta):
	if Input.is_action_just_pressed("button_press"):
		$StartButton.emit_signal("pressed")
	pass

func show_message(text):
	$CountdownLabel.text = text
	$CountdownLabel.show()

func _on_StartButton_pressed():
	$StartButton.hide()
	emit_signal("start_game")

func _on_StartTimer_timeout():
	$CountdownLabel.hide()
