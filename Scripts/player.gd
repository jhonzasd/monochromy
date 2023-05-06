extends CharacterBody2D

var speed := 250
var direccion := 0.0 
var jump := 500
var lives := 3
const gravity := 18.5
var died : bool = false
# Doble salto:
var cont_jump : int = 0
var max_jump : int = 2

@onready var sprite := $Sprite2D
@onready var animation := $AnimationPlayer

func _physics_process(delta):
	var chests = get_parent().chests
	direccion = Input.get_axis("ui_left","ui_right")
	
	if direccion != 0 and is_on_floor():
		animation.play("walk")
	else:
		animation.play("iddle")
	if chests >= 2 and Input.is_key_pressed(KEY_SHIFT):
		velocity.x = direccion * speed * 2
		animation.speed_scale = 2.5
	else:
		velocity.x = direccion * speed
	
	if chests > 0:
		if is_on_floor():
			cont_jump = 0
			if Input. is_action_just_pressed("ui_accept"):
				cont_jump += 1
				velocity.y -= jump
				
		else:
			if Input. is_action_just_pressed("ui_accept") and chests >= 3 and max_jump > cont_jump:
					cont_jump += 1
					velocity.y -= jump
					
	
		if !is_on_floor():
			animation.play("jump")
	if chests >= 3:
		pass
	velocity.y += gravity
	
	sprite.flip_h = direccion < 0 if direccion != 0 else sprite.flip_h
	
	move_and_slide()
