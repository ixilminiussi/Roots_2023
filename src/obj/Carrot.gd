extends Area2D


var tile_size = 128
var left_shift = 264
var top_shift = 220
# Called when the node enters the scene tree for the first time.
var start_id = 0
var status = "alive"
var checkeredmuch = "no"

func _ready():
	position.x = start_id%9 * tile_size + left_shift
	position.y = int(start_id/9) * tile_size + top_shift
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if (status != "captured"):
		if (get_parent().state == "underground"):
			status = "hidden"
		else:
			status = "alive"

	match status: 
		"alive":
			$AnimatedSprite.play("alive")
		"captured":
			$AnimatedSprite.play("check")
		"hidden":
			$AnimatedSprite.play("hide")


func clear():
	queue_free()


func interact():
	status = "captured"
	checkeredmuch = "checked"
func update_move():
	pass
