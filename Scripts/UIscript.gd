extends CanvasLayer

@onready var gemasalto = $GemaSaltoUI

func _ready():
	gemasalto.visible = false

func _process(_delta):
	$Label.text = str("x") + str(get_parent().keys)
	$Label2.text = str("x") + str(get_parent().lives)
	if get_parent().gema_salto == true:
		gemasalto.visible = true
