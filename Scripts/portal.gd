extends Sprite2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$AnimationPlayer.play("iddle")


func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		body.queue_free()
		get_tree().change_scene_to_file("res://Escenas/level_1.tscn")
