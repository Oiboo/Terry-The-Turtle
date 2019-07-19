extends Area2D

export var stop = true


func _ready():
	if stop==true:
		rotation_degrees=180
	else:
		rotation_degrees=0

func _on_Switch_activate():
	if stop== true:
		stop=false
		rotation_degrees=0
	else:
		stop=true
		rotation_degrees=180

func _on_Directional_Current_body_entered(body):
	if body.get_groups().has("player"):
		
		if stop!=true:
			body.Force = 10
		else:
			body.Force = -10
		

func _on_Directional_Current_body_exited(body):
	if body.get_groups().has("player"):
		stop = true
		body.Force = 1


