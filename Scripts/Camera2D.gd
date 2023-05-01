extends Camera2D


var player

func _ready():
	player= get_parent().get_node("Player")
	

func _physics_process(delta):
	position.x = player.position.x
	position.y = player.position.y
