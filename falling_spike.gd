extends StaticBody2D

const velocidad = 20

func _physics_process(delta):
	position.y += velocidad
