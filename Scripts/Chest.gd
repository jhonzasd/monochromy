extends Area2D

var chest_is_open : bool = false

func _on_body_entered(body):
	var keys = get_parent().keys
	if body.is_in_group("player") && keys > 0 && chest_is_open == false:
		get_parent().keys -= 1
		get_parent().chests += 1
		print(get_parent().chests)
		chest_is_open = true
		$Animation.play("open")
		
		
