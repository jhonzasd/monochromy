extends Area2D
@onready var animation = $AnimationPlayer
var chest_is_open : bool = false

func _on_body_entered(body):
	var keys = get_parent().keys
	if body.is_in_group("player") && keys > 0 && chest_is_open == false:
		get_parent().keys -= 1
		get_parent().chests += 1
		print(get_parent().chests)
		chest_is_open = true
		animation.play("open")
		
		
		


func _on_animation_player_animation_finished(open):
	self.animation.play("opened")
	get_parent().gema_doble_salto = true
