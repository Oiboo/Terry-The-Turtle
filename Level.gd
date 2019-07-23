extends Node

#LEVEL CODE add into every level
onready var scene = preload("res://Player.tscn")
onready var spawn_point = Vector2()
onready var last_room = 0


func _ready():
	if main.back == false:
		spawn_point=($prev_screen.position + $prev_screen.offset)
	elif main.back == true:
		spawn_point=($next_screen.position + $next_screen.offset)
		
	var p = scene.instance()
	p.set_position(spawn_point)
	
	add_child(p)
	
	
	print(p.get_name())




