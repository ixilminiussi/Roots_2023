extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var goal 


# Called when the node enters the scene tree for the first time.
func _ready():
	$Player.start($StartPosition.position) # Replace with function body.
	#Viewport.render_direct_to_screen = true
	goal = 3 #goal to change based on 


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
