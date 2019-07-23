extends Control


func _input(event):
	if event.is_action_pressed("pause"):
		var pause_state =  not get_tree().paused
		get_tree().paused = pause_state
		visible = pause_state



func _on_resume_pressed():
	var pause_state =  not get_tree().paused
	get_tree().paused = pause_state
	visible = pause_state
	
func _on_load_pressed():
	var pause_state =  not get_tree().paused
	get_tree().paused = pause_state
	visible = pause_state
	Save.load_game()
	
func _on_quit_pressed():
	get_tree().quit()
	



