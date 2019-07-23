extends StaticBody2D

var off=true
export var max_need = 10
signal activate

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("Pswitch")
	get_node("label/max").set_text(str(max_need))
	
func take_coin():
	if main.score >= max_need:
		main.score-= max_need
		get_node("label/got").set_text(str(max_need)+ "/")
		emit_signal("activate")
	