extends Area2D

export var tilesize = 64
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO # The player's movement vector.
	
	if get_parent().state:
		if Input.is_action_just_pressed("move_right"):
			velocity.x += 1
		if Input.is_action_just_pressed("move_left"):
			velocity.x -= 1
		if Input.is_action_just_pressed("move_down"):
			velocity.y += 1
		if Input.is_action_just_pressed("move_up"):
			velocity.y -= 1

	if velocity.length() > 0:
		velocity = velocity.normalized() * tilesize
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
	position += velocity
	
	
	
	#position.x = clamp(position.x, 0, screen_size.x)
	#position.y = clamp(position.y, 0, screen_size.y)

	#if velocity.x != 0:
	#	$AnimatedSprite.animation = "carrot"
	#	$AnimatedSprite.flip_v = false
	#	$AnimatedSprite.flip_h = velocity.x < 0
	#elif velocity.y != 0:
	#	$AnimatedSprite.animation = "up"
	#	$AnimatedSprite.flip_v = velocity.y > 0


func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
