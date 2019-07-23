extends KinematicBody2D

const SPEED = 50
const FLOOR = Vector2(0,-1)

onready var timer1 = get_node("Timer")

var velocity = Vector2()
var direction =1
var stop = false

func _ready():
	add_to_group("enemy")


func _physics_process(delta):
	if stop == false:
		velocity.y = SPEED * direction
		
	
		velocity = move_and_slide(velocity,FLOOR)
	if (get_slide_count()>0):
		var collider = self.get_slide_collision(0).collider
		if collider.name == "Player":
				collider.damage()
	
	
	if is_on_floor():
		direction = direction * -1
		
	if is_on_ceiling():
		direction = direction * -1

func freeze():
	stop = true
	timer1.start()
	get_node("Sprite").modulate = Color(1,0,0)

func _on_Timer_timeout():
	stop = false
	get_node("Sprite").modulate = Color(1,1,1)
