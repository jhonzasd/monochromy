extends CanvasLayer

func _process(_delta):
	$Label.text = str("x") + str(get_parent().keys)
	$Label2.text = str("x") + str(get_parent().lives)
