extends StaticBody2D



func _on_body_entered(body):
	if body_is_in_group("player"):
