extends Sprite2D


func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		get_parent().keys += 1
		print(str(get_parent().keys))
		queue_free()
