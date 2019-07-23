extends Control



func _on_Start_Game_pressed():
	get_tree().change_scene("res://World.tscn")




func _on_Load_Game_pressed():
	#Load function
	Save.load_game()
	#var level = "res://" + main.scene + ".tscn"
	#get_tree().change_scene(level)
	
	
func _on_Quit_Game_pressed():
	get_tree().quit()
