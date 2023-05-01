extends CharacterBody2D

var speed: int = 100

@onready var sprite = $Sprite2D
@onready var animation = $AnimationPlayer

func _ready():
	velocity.x = -speed
	
func _physics_process(delta):
	if is_on_wall():
		if !sprite.flip_h: # Está mirando a la izquierda
			velocity.x = speed
		else:
			velocity.x = -speed
			
	move_and_slide()
	if velocity.x < 0: # Está mirando a la izquierda
		sprite.flip_h = false
	elif velocity.x > 0: # Está mirando a la derecha
		sprite.flip_h = true
	animation.play("iddle")
