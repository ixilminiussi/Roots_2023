extends CanvasLayer

signal start_game


func _ready():
	$TopTab.visible = false
	$NextButton.hide()
	$NextButton/CanvasLayer.visible = false
	
	
func _process(delta):
	if Input.is_action_just_pressed("button_press"):
		$StartButton.emit_signal("pressed")
	pass

func show_message(text):
	$TopTab/CountdownTab/CountdownLabel.text = text
	$TopTab/CountdownTab/CountdownLabel.show()

func _on_StartButton_pressed():
	$SideTab.visible = false
	$TopTab.visible = true
	$StartButton.hide()
	$StartButton/CanvasLayer.visible = false
	emit_signal("start_game")

func _on_StartTimer_timeout():
	$TopTab/CountdownTab/CountdownLabel.hide()
	$TopTab/Goal.visible = true
	$TopTab/Goal/GoalLabel.show()

