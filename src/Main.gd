extends Node2D

var carrot_import = preload("res://src/obj/Carrot.tscn")
var bomb_import = preload("res://src/obj/Bomb.tscn")

export var tile_size = 128

signal overground
signal underground

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var goal 
var state = 0 #0 for overground, 1 for underground

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	var example = range(0,45)
	example.shuffle()
	#Viewport.render_direct_to_screen = true
	goal = 3 #goal to change based on 

	$Player.start(Vector2(1*tile_size + 4*tile_size, 1*tile_size + 5*tile_size)) # Replace with function body.
	#var ids = []			
	var level_list = []
	for _i in range(45):
		level_list.append(0)
	for idx in range(10): 
		level_list[example[idx]] = int(idx/5) + 1 
	print(level_list)
	
	for pos in level_list.size():
		match level_list[pos]:
			1:
				var carrot = carrot_import.instance()
				carrot.start_id = pos
				add_child(carrot)
			2: 
				var bomb = bomb_import.instance()
				bomb.start_id = pos
				add_child(bomb)
	
	var root_node = get_tree().get_root()
	var node_list = root_node.get_children()[0].get_children()
	for node in node_list:
		print(node.get_name())
	
	#map to center
	#$map.position =Vector2((3 * tile_size + 4.5 * tile_size), (2 * tile_size + 2.5
	# * tile_size))
	#$map/CollisionShape2D.shape.extents = Vector2(4.5*tile_size, 2.5*tile_size)

func start_game():
	$StartTimer.start()
	$Player.start($StartPosition.position)
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	$HUD.show_message(String(int($StartTimer.time_left) + 1))

	#carrot interaction
	var objects = $Player.get_overlapping_areas()
	if Input.is_action_just_pressed("interact"):
		for obj in objects:
			obj.interact()

func overground():
	state = 0
	emit_signal("overground")
	
func underground():
	state = 1
	emit_signal("underground")
