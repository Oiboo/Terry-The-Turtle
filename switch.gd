extends StaticBody2D

var off=true
signal activate

func _ready():
	add_to_group("switch")
	
func switch():
	if off==true:
		get_node("Sprite").modulate = Color(0,1,0)
		off=false
	elif off==false:
		get_node("Sprite").modulate = Color(1,0,0)
		off=true
	emit_signal("activate")


