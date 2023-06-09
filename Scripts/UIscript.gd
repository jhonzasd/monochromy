extends CanvasLayer

@onready var gemasalto = $GemaSaltoUI
@onready var gemacorrer = $GemaCorrerUI
@onready var gemadoblesalto = $GemaDobleSaltoUI


var popUpGemaYumpa := []  # Lista de nodos


func _ready():
	gemasalto.visible = false
	gemacorrer.visible = false
	gemadoblesalto.visible = false
	# Agrega los nodos a la lista
	popUpGemaYumpa.append($GemaYumpa/SpaceIcon)
	popUpGemaYumpa.append($GemaYumpa/GemaText)
	popUpGemaYumpa.append($GemaYumpa/DescriptionText)
	popUpGemaYumpa.append($GemaYumpa/YumpaText)
	set_yumpa_visibility(false)
	
func set_yumpa_visibility(visible: bool): # Itera sobre la lista de nodos y modifica su visibilidad
	for node in popUpGemaYumpa:
		node.visible = visible
		
func _process(delta):
	$Label.text = str("x") + str(get_parent().keys)
	$Label2.text = str("x") + str(get_parent().lives)
	
	if get_parent().gema_salto == true:
		gemasalto.visible = true
		set_yumpa_visibility(true)
		
	if get_parent().gema_correr == true:
		gemacorrer.visible = true
	if get_parent().gema_doble_salto == true:
		gemadoblesalto.visible = true


func _on_timer_timeout():
	set_yumpa_visibility(false)
