extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$CountdownTab.visible = false
	$Goal/GoalLabel.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_StartTimer_timeout():
	$CountdownTab.visible = false


func _on_Main_starting_timer():
	$CountdownTab.visible = true
	$CountdownTab/AnimatedSprite.play()


func _on_NextButton_pressed():
	$Goal.visible = false
	$Goal/GoalLabel.hide()
