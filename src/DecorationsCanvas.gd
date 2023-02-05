extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if get_parent().state == "underground":
		$UndergroundTexture.show()
		$OvergroundTexture.hide()
	else:
		$OvergroundTexture.show()
		$UndergroundTexture.hide()
