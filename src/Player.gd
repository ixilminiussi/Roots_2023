extends Area2D

export var tile_size = 128
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var status = "alive"
signal moved
signal died
signal died_by_dog

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
	
	var previous = position
	position += velocity * tile_size
	position.x = clamp(position.x, 264, 1288)
	position.y = clamp(position.y, 220, 732)
	if (position - previous != Vector2.ZERO):
		emit_signal("moved")
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
	print(area.position, position)
	var object_type = str(area)
	if (object_type.find("Bomb") >= 0):
		die(false)
	if (object_type.find("Dog") >= 0 and (area.position - position)<Vector2(40,0)):
		die(true)
		



# Called when the player fucking dies
func die(by_dog):
	if by_dog:
		emit_signal("died_by_dog")
	else:
		emit_signal("died")
	status = "dead"
	$DeathTimer.start()
