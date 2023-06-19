extends StaticBody2D


const velocidad = 2

func _physics_process(delta):
	position.y += velocidad
