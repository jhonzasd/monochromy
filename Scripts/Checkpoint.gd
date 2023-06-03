extends Area2D

@onready var animation = $AnimationPlayer
var animation_played = 0

func _on_body_entered(body):
	if body.is_in_group("player") and animation_played == 0:
		if !get_parent().checkpoint or get_parent().checkpoint.get_meta("num") < self.get_meta("num"):
			get_parent().checkpoint = self
		animation.play("grab")
		animation_played += 1
	else:
		animation.play("iddle2")

func _on_animation_player_animation_finished(grab):
	animation.play("iddle2")
	
