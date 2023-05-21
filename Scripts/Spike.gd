extends Area2D

func _on_body_entered(body):
	if body.is_in_group("player"):
		get_parent().lives -= 1
		body.queue_free()
		get_parent().respawn()
		get_parent().died = true
