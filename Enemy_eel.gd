extends Path2D

onready var follow = get_node("follow")
var active=false
onready var timer = get_node("Timer")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	follow.set_offset(follow.get_offset() + 350 * delta)



func _on_body_body_entered(body):
	if body.name == "Player":
		body.damage()


func _on_electric_body_entered(body):
	if active == true:
		if body.name == "Player":
			body.damage()


func _on_Timer_timeout():
	active  = not active
	get_node("follow/elec").set_visible(active)