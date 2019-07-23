extends Area2D

# Declare member variables here. Examples:
# var a = 2


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	if body.name == "Player":
		#set main room var
		main.scene = get_tree().get_current_scene().get_name()
		main.posit = self.get_position()
		main.health = main.max_health
		main.magic = main.max_magic
		#save game function
		get_node("Sprite").modulate = Color(1,1,0)
		Save.save_game()
		

