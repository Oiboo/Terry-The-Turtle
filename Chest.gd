extends Area2D

var open = false
export var amm = 10

func _on_Area2D_body_entered(body):
	if body.name == "Player":
		if open==false:
			get_node("/root/main").score+=amm
			open=true
