extends CanvasLayer

func _process(delta):
	$TextureProgressBar.value = get_parent().stamina
