extends Area2D

var tile_size = 128
var left_shift = 1*tile_size
var top_shift = 1*tile_size
# Called when the node enters the scene tree for the first time.
var start_id = 0
var status = "alive"

func _ready():
	position.x = start_id%9 * tile_size + left_shift
	position.y = int(start_id/9) * tile_size + top_shift
	# $CollisionShape2D.shape.extents = Vector2(tile_size/2, tile_size/2)
	# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	match status: 
		"alive":
			$AnimatedSprite.play("alive")
		"dead":
			$AnimatedSprite.play("hidden")

func interact():
	status = "dead"
