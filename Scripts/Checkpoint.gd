extends Area2D

func _on_body_entered(body):
	if body.is_in_group("player"):
		if !get_parent().checkpoint or get_parent().checkpoint.get_meta("num") < self.get_meta("num"):
			get_parent().checkpoint = self
