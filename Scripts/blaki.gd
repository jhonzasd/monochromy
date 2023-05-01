extends CharacterBody2D

var speed: int = 50
var follow : bool = false
var speed_follow = 100
@onready var sprite = $Sprite2D
@onready var animation = $AnimationPlayer

func _ready():
	velocity.x = -speed
	
func _physics_process(delta):
	detect()
	if !follow:
		if is_on_wall():
			if !sprite.flip_h: # Está mirando a la izquierda
				velocity.x = speed
			else:
				velocity.x = -speed
					
		
		if velocity.x < 0: # Está mirando a la izquierda
			sprite.flip_h = false
		elif velocity.x > 0: # Está mirando a la derecha
			sprite.flip_h = true
		animation.play("iddle")
	move_and_slide()
func detect():
	if $RightRay.is_colliding(): # Raycast de la derecha está colisionando
		var obj = $RightRay.get_collider()
		if obj.is_in_group("player"):
			velocity.x = speed_follow
			follow = true
			sprite.flip_h = true
			animation.play("FollowPlayer")
		else:
			follow = false
	if $LeftRay.is_colliding(): # Raycast de la izquierda está colisionando
		var obj = $LeftRay.get_collider()
		if obj.is_in_group("player"):
			velocity.x = -speed_follow
			sprite.flip_h = false
			follow = true
			animation.play("FollowPlayer")
		else:
			follow = false
