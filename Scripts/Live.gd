extends Area2D

func _on_body_entered(body):
	if body.is_in_group("player"):
		get_parent().lives += 1
		print(str(get_parent().lives))
		queue_free()
