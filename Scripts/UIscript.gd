extends CanvasLayer

@onready var gemasalto = $GemaSaltoUI
@onready var gemacorrer = $GemaCorrerUI
@onready var gemadoblesalto = $GemaDobleSaltoUI

@onready var animation = $PopUpGemaSalto/AnimationPlayer
@onready var timer = $Timer

var popUpGemaYumpa := []  # Lista de nodos


func _ready():
	gemasalto.visible = false
	gemacorrer.visible = false
	gemadoblesalto.visible = false
	# Agrega los nodos a la lista
	popUpGemaYumpa.append($PopUpGemaSalto)
	popUpGemaYumpa.append($YumpaText)
	popUpGemaYumpa.append($DescriptionText)
	popUpGemaYumpa.append($GemaText)
	popUpGemaYumpa.append($SpaceIcon)
	set_node_visibility(false)
	
func set_node_visibility(visible: bool): # Itera sobre la lista de nodos y modifica su visibilidad
	for node in popUpGemaYumpa:
		node.visible = visible
		
func _process(delta):
	$Label.text = str("x") + str(get_parent().keys)
	$Label2.text = str("x") + str(get_parent().lives)
	
	if get_parent().gema_salto == true:
		gemasalto.visible = true
		set_node_visibility(true)
		
	if get_parent().gema_correr == true:
		gemacorrer.visible = true
	if get_parent().gema_doble_salto == true:
		gemadoblesalto.visible = true
