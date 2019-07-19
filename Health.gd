extends "res://main.gd"



func _on_Health_body_entered(body):
	if body.name == "Player":
		get_node("/root/main").health+=1
		queue_free()
