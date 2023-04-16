extends Node2D

var keys : int = 0
var chests : int = 0
var lives : int = 3
var died : bool = false

var checkpoint = false # El jugador no ha llegado al checkpoint
var player = load("res://Escenas/player.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	aparecer()

func aparecer():
	var newplayer = player.instantiate()
	if !checkpoint:
		newplayer.position = $SpawnPlayer.position
	else:
		newplayer.position = $Checkpoint.position
	add_child(newplayer)
