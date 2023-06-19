extends CanvasLayer

@onready var gemasalto = $GemaSaltoUI
@onready var gemacorrer = $GemaCorrerUI
@onready var gemadoblesalto = $GemaDobleSaltoUI

@onready var stamina = $GemaRumpa/TextureProgressBar
 # Listas de nodos
var popUpGemaYumpa := [] 
var popUpGemaRumpa := []
var popUpGemaDoyumpa := []

func _ready():
	gemasalto.visible = false
	gemacorrer.visible = false
	gemadoblesalto.visible = false
	# Agrega los nodos de la gema yumpa a la lista
	popUpGemaYumpa.append($GemaYumpa/SpaceIcon)
	popUpGemaYumpa.append($GemaYumpa/GemaText)
	popUpGemaYumpa.append($GemaYumpa/DescriptionText)
	popUpGemaYumpa.append($GemaYumpa/YumpaText)
	set_yumpa_visibility(false)
	# Agrega los nodos de la gema rumpa a la lista
	popUpGemaRumpa.append($GemaRumpa/Gema2Text)
	popUpGemaRumpa.append($GemaRumpa/RumpaText)
	popUpGemaRumpa.append($GemaRumpa/DescriptionText)
	popUpGemaRumpa.append($GemaRumpa/ShiftIcon)
	set_rumpa_visibility(false)
	# Agrega los nodos de la gema Doyumpa a la lista
	popUpGemaDoyumpa.append($GemaDoyumpa/Gema3Text)
	popUpGemaDoyumpa.append($GemaDoyumpa/DoyumpaText)
	popUpGemaDoyumpa.append($GemaDoyumpa/DescriptionText)
	popUpGemaDoyumpa.append($GemaDoyumpa/SpaceIcon)
	set_doyumpa_visibility(false)
	
func set_yumpa_visibility(visible: bool): # Itera sobre la lista de nodos y modifica su visibilidad
	for node in popUpGemaYumpa:
		node.visible = visible
		
func set_rumpa_visibility(visible: bool): # Itera sobre la lista de nodos y modifica su visibilidad
	for node in popUpGemaRumpa:
		node.visible = visible
		
func set_doyumpa_visibility(visible: bool): # Itera sobre la lista de nodos y modifica su visibilidad
	for node in popUpGemaDoyumpa:
		node.visible = visible
		
func _physics_process(delta):
	$Label.text = str("x") + str(get_parent().keys)
	$Label2.text = str("x") + str(get_parent().lives)
	$Label3.text = str("stamina") + str(get_parent().stamina)
	$TextureProgressBar.value = get_parent().stamina
	
	if get_parent().gema_salto == true:
		gemasalto.visible = true
		set_yumpa_visibility(true)
		
	if get_parent().gema_correr == true:
		gemacorrer.visible = true
		set_rumpa_visibility(true)
		
	if get_parent().gema_doble_salto == true:
		gemadoblesalto.visible = true
		set_doyumpa_visibility(true)

func _on_timer_timeout():
	set_yumpa_visibility(false)
