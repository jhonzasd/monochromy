extends CanvasLayer

@onready var gemasalto = $GemaSaltoUI
@onready var gemacorrer = $GemaCorrerUI
@onready var gemadoblesalto = $GemaDobleSaltoUI

func _ready():
	gemasalto.visible = false
	gemacorrer.visible = false
	gemadoblesalto.visible = false
	
func _process(_delta):
	$Label.text = str("x") + str(get_parent().keys)
	$Label2.text = str("x") + str(get_parent().lives)
	
	if get_parent().gema_salto == true:
		gemasalto.visible = true
	if get_parent().gema_correr == true:
		gemacorrer.visible = true
	if get_parent().gema_doble_salto == true:
		gemadoblesalto.visible = true
