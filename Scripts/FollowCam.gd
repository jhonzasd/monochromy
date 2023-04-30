extends Camera2D

# Called when the node enters the scene tree for the first time.
func _ready():
	top_level = true
	global_position.y = 700


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position.x = get_parent().global_position.x
