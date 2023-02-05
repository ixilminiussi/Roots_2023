extends Node2D

var carrot_import = preload("res://src/obj/Carrot.tscn")
var bomb_import = preload("res://src/obj/Bomb.tscn")
var dog_import = preload("res://src/obj/Dog.tscn")

export(int) var current_level
var level_list = []

export var LEVEL = 1
export var tile_size = 128

signal overground
signal underground
signal win
signal starting_timer
signal carrot_eaten
signal game_start

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var goal = 0
var goal_c = 0
var win = false
var state = "overground"

# Called when the node enters the scene tree for the first time.
func _ready():
	$Player.start($StartPosition.position)
	
	#map to center
	#$map.position =Vector2((3 * tile_size + 4.5 * tile_size), (2 * tile_size + 2.5
	# * tile_size))
	#$map/CollisionShape2D.shape.extents = Vector2(4.5*tile_size, 2.5*tile_size)


# Starts the game.
func start_game():
	clear_stage()
	load_level(current_level)
	overground()
	$StartTimer.start()
	emit_signal("starting_timer")
	emit_signal("game_start")
	$Player.start($StartPosition.position)
	goal = 0
	
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	$HUD.show_message(String(int($StartTimer.time_left) + 1))
	$HUD/TopTab/Goal/GoalLabel.set_text(str("gather ", goal_c, " out of ", goal, "\ncarrots"))
	
	if Input.is_action_just_pressed("cheat"):
		if state == "overground":
			underground()
		elif state == "underground":
			overground()

	#carrot interaction
	var objects = $Player.get_overlapping_areas()
	if Input.is_action_just_pressed("interact"):
		for obj in objects:
			if (obj.get_name().find("Carrot") >= 0 and obj.status != "captured"):
				emit_signal("carrot_eaten")
				goal_c -= 1
			obj.interact()
			if (goal_c == 0):
				emit_signal("win")
	#if (goal)

func overground():
	state = "overground"
	emit_signal("overground")
	
func underground():
	state = "underground"
	emit_signal("underground")


func clear_stage():
	var root_node = get_tree().get_root()
	var node_list = root_node.get_children()[0].get_children()
	
	print(node_list)
	for node in node_list:
		var object_type = str(node)
		if (object_type.find("Bomb") >= 0 or object_type.find("Carrot") >= 0 
		or object_type.find("Dog") >= 0):
			node.clear()


# Load a new level on an empty field.
func load_level(level):	
	for i in len($Levels.levels):
		if (level == i):
			level_list = $Levels.levels[i]
	
	for pos in level_list.size():
		match level_list[pos]:
			1:
				var carrot = carrot_import.instance()
				carrot.start_id = pos
				add_child(carrot)
				goal += 1
			2: 
				var bomb = bomb_import.instance()
				bomb.start_id = pos
				add_child(bomb)
			3:
				var dog = dog_import.instance()
				dog.start_id = pos
				add_child(dog)
	goal_c = goal


func _on_Player_moved():
	var root_node = get_tree().get_root()
	var node_list = root_node.get_children()[0].get_children()
	for node in node_list:
		if (str(node.get_class()) == "Area2D" and node.get_name() != "Player"):
			node.update_move()


func _on_Main_win():
	$HUD/NextButton.show()
	$HUD/NextButton/CanvasLayer.visible = true


func _on_NextButton_pressed():
	current_level += 1
	start_game()
	$HUD/NextButton.hide()
	$HUD/NextButton/CanvasLayer.visible = false

var chalk_import = preload("res://src/obj/Chalk.tscn")
var drawing = false
var radius = 100

func _on_Draw_input_event(viewport, event, shape_idx):
	if (state == "underground"):
		if event is InputEventMouseButton:
			if event.pressed:
				drawing = true
				var chalk = chalk_import.instance()
				chalk.pos = event.position
				chalk.rad = radius
				$Draw.add_child(chalk)
			else:
				drawing = false
		if event is InputEventMouseMotion:
			if drawing:
				var chalk = chalk_import.instance()
				chalk.pos = event.position
				chalk.rad = radius
				$Draw.add_child(chalk)


func _on_Main_overground():
	var lines = $Draw.get_children()
	for l in lines:
		if str(l).find("Chalk") >= 0:
			l.queue_free()



