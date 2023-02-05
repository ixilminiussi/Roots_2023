extends Area2D

var tile_size = 128
var left_shift = 260
var top_shift = 220
# Called when the node enters the scene tree for the first time.
var start_id = 0
var direction = 1
var status = "alive"

func _ready():
	position.x = start_id%9 * tile_size + left_shift
	position.y = int(start_id/9) * tile_size + top_shift
	
	
	# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
	if (get_parent().state == "underground"):
		status = "hidden"
	else:
		status = "alive"

	match status: 
		"alive":
			$AnimatedSprite.play("alive")
		"hidden":
			$AnimatedSprite.play("hide")
		
	if direction > 0:
		$AnimatedSprite.flip_h = false
	else:
		$AnimatedSprite.flip_h = true
		

func update_move():
	var previous = Vector2(position.x, position.y)
	print(previous, position)
	position.x += direction*tile_size
	print(previous, position)
	position.x = clamp(position.x, left_shift, left_shift+tile_size*8)
	position.y = clamp(position.y, top_shift, top_shift+tile_size*5)
	if (position - previous == Vector2.ZERO):
		direction *= -1
		position.x += direction*tile_size
func clear():
	queue_free()

	
func interact():
	pass
#func _on_Carrot_area_entered(area):
#	print("eating!")

func _on_Dog_area_entered(area):
	var object_type = str(area)
	if (object_type.find("Bomb") >= 0 or object_type.find("Carrot") >= 0):
		direction *= -1
