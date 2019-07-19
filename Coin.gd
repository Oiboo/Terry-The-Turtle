extends "res://main.gd"


func _on_Coin_body_entered(body):
	if body.name == "Player":
		get_node("/root/main").score+=1
		queue_free()
