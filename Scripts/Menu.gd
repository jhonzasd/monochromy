extends Control


func _ready():
	$GitHub/Label2.visible = false
	
func _on_start_pressed():
	get_tree().change_scene_to_file("res://nivel_1.tscn")


func _on_quit_pressed():
	get_tree().quit()


func _on_git_hub_pressed():
	OS.execute("cmd", ["/c", "start", "https://github.com/jhonzasd"])


func _on_git_hub_mouse_entered():
	$GitHub/Label2.visible = true


func _on_git_hub_mouse_exited():
	$GitHub/Label2.visible = false
