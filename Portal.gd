extends Area2D

export(String,FILE,"*.tscn") var next_world
var active = false

func _on_Portal_body_entered(body):
	if active==true:
		if body.name == "Player":
		
			get_tree().change_scene(next_world)

func _on_Portal_body_exited(body):
	
	pass

func _on_portal_switch_activate():
	active=true
	get_node("Sprite").modulate = Color(1,0,0)