extends CharacterBody2D

var speed : int = 250
var direccion : float = 0.0 
var jump : int = 500
var lives : int = 3
const gravity : float = 18.5
var died : bool = false
# Doble salto:
var cont_jump : int = 0
var max_jump : int = 2

var is_key_shift_enabled = true

@onready var sprite := $Sprite2D
@onready var animation := $AnimationPlayer
@onready var particles := $CPUParticles2D
@onready var collider := $CollisionShape2D

func _physics_process(delta):
	var chests = get_parent().chests
	direccion = Input.get_axis("ui_left","ui_right")
	if is_on_floor():
		animation.play("iddle")
	# Barra de stamina
	if get_parent().stamina >= 200:
		get_parent().stamina = 200
	collider.position = sprite.position
	if get_parent().stamina <= 0:
		is_key_shift_enabled = false
		get_parent().stamina = 0
	else:
		is_key_shift_enabled = true
		
	if direccion != 0 and is_on_floor():
		animation.play("walk")
	if direccion == 0:
		get_parent().stamina += 1
	else:
		animation.play("iddle")
	if chests >= 2 and Input.is_key_pressed(KEY_SHIFT) and is_key_shift_enabled == true:
		velocity.x = direccion * speed * 2
		animation.speed_scale = 2.5
		get_parent().stamina -= 1
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
					
			if Input.is_action_just_released("ui_accept"):
				velocity.y += 6000 * delta
	
		if !is_on_floor():
			animation.play("jump")
	if chests >= 3:
		pass
	velocity.y += gravity
	
	sprite.flip_h = direccion < 0 if direccion != 0 else sprite.flip_h
	
	move_and_slide()
