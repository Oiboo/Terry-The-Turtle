extends StaticBody2D

var health = 3

func _ready():
	add_to_group("blocker")
	
func damage():
	health -=1
	print(health)
	if health==2:
		get_node("Sprite").modulate = Color(1,1,0)
		
	else:
		get_node("Sprite").modulate = Color(1,0,0)
func explode():
	queue_free()

