extends AudioStreamPlayer

var rand_chance = 0
var rng = RandomNumberGenerator.new()
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



func _on_Player_moved():
	rng.randomize()	
	rand_chance = rng.randi_range(0,5)
	print(rand_chance)
	if (rand_chance > 3):
		play()
