extends CharacterBody2D

@onready var sprite = $Sprite2D
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	pass
	#if Input.is_action_pressed("ui_accept"):
		#sprite.flip_h = true
	#else:
		#sprite.flip_h = false
