extends Node2D

var levels = [[0,0,0,0,0,0,0,0,0,
			0,0,0,0,0,0,0,0,0,		#level 0
			0,1,0,0,0,0,0,2,0,
			0,0,0,0,0,0,0,0,0,
			0,0,0,0,0,0,0,0,0],
					
			[1,0,0,0,0,0,0,0,1,
			2,2,2,2,2,2,0,2,2,
			0,1,0,0,0,0,0,2,2,
			0,2,2,2,2,2,0,2,2,		#level 1
			0,0,0,0,0,2,1,2,2],
			
			[2,1,0,0,2,0,0,0,2,
			0,2,0,0,0,1,2,0,0,
			0,1,0,0,0,2,0,2,1,
			2,0,0,2,0,0,0,0,2,		#level 2
			0,2,0,0,0,0,2,0,1],
			
			[0,1,0,0,0,0,0,1,0,
			0,0,0,0,0,0,0,0,0,
			0,0,3,0,0,0,0,0,0,
			0,0,0,0,0,0,0,0,0,		#level 3
			0,0,0,0,0,0,0,0,0],
			
			[0,0,0,0,0,0,0,1,0,
			2,2,2,2,2,2,0,2,2,
			2,0,0,0,0,0,3,0,0,
			2,0,2,2,2,2,2,2,2,		#level 4
			2,0,1,0,0,0,0,0,0,],
			
			[2,1,2,1,2,1,2,1,2,
			3,0,0,0,0,0,0,0,1,
			2,1,2,0,2,0,2,1,2,		#level 5
			1,0,0,0,0,0,0,0,3,
			2,0,2,0,0,0,2,0,2],

			
			[0,0,0,0,0,0,0,0,1,
			0,3,2,2,2,2,2,2,2,
			0,0,0,0,0,1,0,0,0,		#level 6
			2,2,2,2,2,2,2,3,0,
			1,0,0,0,0,0,0,0,0],
			
			[0,0,0,0,0,0,0,0,0,
			3,0,2,0,0,0,2,3,0,
			0,3,2,0,0,0,2,0,3,		#level 7
			3,0,2,0,0,0,2,3,0,
			1,1,2,0,0,0,2,1,1],
			
			[1,2,2,2,2,2,2,1,2,
			3,0,1,0,0,0,0,0,0,
			0,0,0,0,0,0,0,0,0,		#level 8
			2,2,0,2,2,2,2,2,2,
			3,0,1,0,0,0,0,0,1,],
			
			[3,0,2,0,1,0,0,2,1,
			3,0,0,0,0,0,0,0,1,
			3,0,0,1,2,0,0,0,0,		#level 9
			3,0,0,0,0,0,1,2,2,
			3,0,0,1,0,0,0,0,1,],
			
			
			[0,1,0,0,2,1,0,0,1,
			0,0,0,0,2,0,0,0,0,
			2,0,2,2,2,2,2,0,2,		#level 10
			0,3,0,2,1,2,0,0,3,
			0,0,0,0,0,0,0,0,0,]]




# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
