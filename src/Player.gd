extends Area2D

export var tile_size = 128
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var status = "alive"

# Called when the node enters the scene tree for the first time.
func _ready():
	#$CollisionShape2D.shape.extents = Vector2(tile_size/2 - 1, tile_size/2 - 1)
	$AnimatedSprite.play() # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var velocity = Vector2.ZERO # The player's movement vector.
	
	if get_parent().state == "underground" and status == "alive":
		$AnimatedSprite.animation = "underworld"
		if Input.is_action_just_pressed("move_right"):
			$AnimatedSprite.flip_h = true
			velocity.x += 1
		if Input.is_action_just_pressed("move_left"):
			$AnimatedSprite.flip_h = false
			velocity.x -= 1
		if Input.is_action_just_pressed("move_down"):
			velocity.y += 1
		if Input.is_action_just_pressed("move_up"):
			velocity.y -= 1
	else:
		$AnimatedSprite.animation = "overworld"
		
	if status == "dead":
		$AnimatedSprite.animation = "dead"

	position += velocity * tile_size
	position.x = clamp(position.x, 128, 1152)
	position.y = clamp(position.y, 128, 640)

	#if velocity.x != 0:
	#	$AnimatedSprite.animation = "carrot"
	#	$AnimatedSprite.flip_v = false
	#	$AnimatedSprite.flip_h = velocity.x < 0
	#elif velocity.y != 0:
	#	$AnimatedSprite.animation = "up"
	#	$AnimatedSprite.flip_v = velocity.y > 0


# Called when the game starts.
func start(pos):
	status = "alive"
	position = pos
	show()
	$CollisionShape2D.disabled = false


# Called when the player is over another object
func _on_Player_area_entered(area):
	var object_type = str(area)
	if (object_type.find("Bomb") >= 0):
		die()


# Called when the player fucking dies
func die():
	status = "dead"
	$DeathTimer.start()
