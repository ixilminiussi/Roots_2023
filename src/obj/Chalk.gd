extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var pos
var rad


# Called when the node enters the scene tree for the first time.
func _ready():
	position = pos
	$CollisionShape2D.shape.radius = rad



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
