extends Node
const SAVE_PATH = "res://save.json"

var score = 0 setget set_score
var health = 3 setget set_health
var magic = 10 setget set_magic
var max_health = 3
var max_magic = 10
var scene = "world"
var posit = Vector2()
var back = false
var dash_force = 2

func set_score(value):
	score = value
	get_node("/root/main/HUD/score").set_text("Coins:"+str(score))
	
	
func set_health(value2):
	health = value2
	get_node("/root/main/HUD/health").set_text("Health:"+str(health))
	
func set_magic(value3):
	magic = value3
	get_node("/root/main/HUD/magic").set_text("Energy:"+str(magic))
	
	
func save():
	var save_dict = {
		"pos_x":posit.x,
		"pos_y":posit.y,
		"health" : health,
		"score" : score,
		"magic" : magic,
		"scene" : scene,
		"max_health" : max_health,
		"max_magic" : max_magic,
		"dash_force" : dash_force
	}
 return save_dict

