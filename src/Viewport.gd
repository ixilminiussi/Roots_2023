extends Viewport

# Called when the node enters the scene tree for the first time.
func _ready():
	render_direct_to_screen = true
	#get_camera().make_current()
	get_tree().set_screen_stretch(SceneTree.STRETCH_MODE_2D,SceneTree.STRETCH_ASPECT_KEEP,Vector2(1680,1050))

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
