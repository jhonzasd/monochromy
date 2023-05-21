extends Area2D

@onready var animation = $AnimationPlayer
var animation_played = false

func _on_body_entered(body):
	if body.is_in_group("player"):
		if !get_parent().checkpoint or get_parent().checkpoint.get_meta("num") < self.get_meta("num"):
			get_parent().checkpoint = self
		animation.play("grab")
	if animation_played == true:
		animation.play("iddle2")
	else:
		animation.play("iddle")



func _on_animation_player_animation_finished(grab):
	animation.play("iddle2")
	animation_played = true
	
