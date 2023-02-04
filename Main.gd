extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var goal 
var state = 0 #0 for overground, 1 for underground

# Called when the node enters the scene tree for the first time.
func _ready():
	#Viewport.render_direct_to_screen = true
	goal = 3 #goal to change based on 

func start_game():
	$StartTimer.start()
	$Player.start($StartPosition.position)
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$HUD.show_message(String(int($StartTimer.time_left) + 1))

func overground():
	state = 0
	
func underground():
	state = 1
