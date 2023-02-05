extends Node2D

var carrot_import = preload("res://src/obj/Carrot.tscn")
var bomb_import = preload("res://src/obj/Bomb.tscn")
var dog_import = preload("res://src/obj/Dog.tscn")

var current_level = 0
var level_list = []

export var LEVEL = 1
export var tile_size = 128

signal overground
signal underground
signal win

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var goal = 0
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
	$Player.start($StartPosition.position)
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	$HUD.show_message(String(int($StartTimer.time_left) + 1))
	$Goal.text = str(goal)
	$Goal.show()
	
	if Input.is_action_just_pressed("cheat"):
		if state == "overground":
			state = "underground"
		elif state == "underground":
			state = "overground"

	#carrot interaction
	var objects = $Player.get_overlapping_areas()
	if Input.is_action_just_pressed("interact"):
		for obj in objects:
			if (obj.get_name().find("Carrot") >= 0 and obj.status != "captured"):
				goal -= 1
			obj.interact()
			if (goal == 0):
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


func _on_Player_moved():
	var root_node = get_tree().get_root()
	var node_list = root_node.get_children()[0].get_children()
	for node in node_list:
		if (str(node.get_class()) == "Area2D" and node.get_name() != "Player"):
			node.update_move()


func _on_Main_win():
	current_level += 1
	start_game()
