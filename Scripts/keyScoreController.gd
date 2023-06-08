extends Node2D

var gema_salto : bool = false
var gema_correr : bool = false
var gema_doble_salto : bool = false

var keys : int = 0
var chests : int = 0
var lives : int = 3
var died : bool = false

var checkpoint = false # El jugador no ha llegado al checkpoint
var player = load("res://Escenas/player.tscn")

#var gema_salto = false # El jugador no ha llegado a la gema
#var gema = load("res://Escenas/gema_salto.tscn")
func _physics_process(delta):
	if lives < 0:
		get_tree().reload_current_scene()
		
func _ready():
	respawn()
#	aparecer_gema()

func respawn():
	var newplayer = player.instantiate()
	if !checkpoint:
		newplayer.position = $SpawnPlayer.position
	else:
		newplayer.position = checkpoint.position + Vector2(0, -100)
		
	add_child(newplayer)

#func aparecer_gema():
#	var newgema = gema.instantiate()
#	if gema_salto == true:
#		newgema.position = $SpawnGemaSalto.position
#		
#		add_child(newgema)
