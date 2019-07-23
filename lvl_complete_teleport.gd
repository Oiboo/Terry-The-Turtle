extends Area2D

export(String,FILE,"*.tscn") var next_world


export var back = false

var offset = Vector2()
export var up = false
export var right = false
export var down = false
export var left = false

var up_am = Vector2(0,-96)
var left_am = Vector2(-96,0)
var down_am = Vector2(0,96)
var right_am = Vector2(96,0)

func _ready():
	 if up == true:
			offset = up_am
	 if right == true:
			offset = right_am
	 if down == true:
			offset = down_am
	 if left == true:
			offset = left_am
func _physics_process(delta):
	
		var bodies = get_overlapping_bodies()
	
		for body in bodies:
			if body.name == "Player":
				if back == false:
					main.back=false
				
				else:
					main.back=true
				get_tree().change_scene(next_world)
			





