extends CanvasLayer

signal start_game

func show_message(text):
	$CountdownLabel.text = text
	$CountdownLabel.show()

func _on_StartButton_pressed():
	$StartButton.hide()
	emit_signal("start_game")

func _on_StartTimer_timeout():
	$CountdownLabel.hide()
