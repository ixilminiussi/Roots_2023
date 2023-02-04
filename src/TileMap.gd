extends TileMap

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func overground():
	var new_texture = load("res://assets/tilemap_ow.png") 
	tile_set.tile_set_texture(0, new_texture)
	tile_set.tile_set_texture(1, new_texture)
	tile_set.tile_set_texture(2, new_texture)

func underground():
	var new_texture = load("res://assets/tilemap_uw.png")
	tile_set.tile_set_texture(0, new_texture)
	tile_set.tile_set_texture(1, new_texture)
	tile_set.tile_set_texture(2, new_texture)
	
