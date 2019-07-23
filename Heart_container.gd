extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Heart_container_body_entered(body):
	if body.name == "Player":
		main.max_health += 1
		main.health = main.max_health
		
		queue_free()
		
