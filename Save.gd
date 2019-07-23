extends Node

const SAVE_PATH = "res://save.json"


func _ready():
	pass
	
func save_game():
	var save_game = File.new()
	save_game.open(SAVE_PATH, File.WRITE)
	save_game.store_line(to_json(main.save()))
func load_game():
	
	var save_game = File.new()
	if not save_game.file_exists(SAVE_PATH):
		return # Error! We don't have a save to load.
		#open
	save_game.open(SAVE_PATH, File.READ)
	
	var current_line = parse_json(save_game.get_line())
	
	main.health = current_line['health']
	main.magic = current_line['magic']
	main.score = current_line['score']
	main.posit = Vector2(current_line['pos_x'],current_line['pos_y'])
	main.max_health = current_line['max_health']
	main.max_magic = current_line['max_magic']
	main.dash_force = current_line['dash_force']
	var level= "res://" + current_line['scene'] + ".tscn"
	get_tree().change_scene(level)
	save_game.close()
	
