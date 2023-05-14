extends Camera2D

# Called when the node enters the scene tree for the first time.
func _enter_tree():
	top_level = true
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position.x = get_parent().player.position.x
