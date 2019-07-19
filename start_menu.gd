extends Control



func _on_Start_Game_pressed():
	get_tree().change_scene("res://World.tscn")


func _on_Quit_Game_pressed():
	get_tree().quit()
