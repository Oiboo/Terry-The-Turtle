extends Node

var score = 0 setget set_score
var health = 3 setget set_health
var magic = 10 setget set_magic

func set_score(value):
	score = value
	get_node("/root/main/HUD/score").set_text("Coins:"+str(score))
	
	
func set_health(value2):
	health = value2
	get_node("/root/main/HUD/health").set_text("Health:"+str(health))
	
func set_magic(value3):
	magic = value3
	get_node("/root/main/HUD/magic").set_text("Energy:"+str(magic))