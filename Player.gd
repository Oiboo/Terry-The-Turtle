extends KinematicBody2D

export var  Speed = 100
export (PackedScene) var bullet
onready var bullet_container = get_node("bullet_container")
onready var gun_timer = get_node("Gun_timer")

var velocity

var Force = 1
var active = false


func _ready():
	add_to_group("player")
func get_input():
	# Detect up/down/left/right keystate and only move when pressed
	
	var velocity = Vector2(0,0)
	if Input.is_action_pressed('ui_right'):
	
		velocity.x += 1
	if Input.is_action_pressed('ui_left'):
	
		velocity.x -= 1
	if Input.is_action_pressed('ui_down'):
		velocity.y += 1
	if Input.is_action_pressed('ui_up'):
		velocity.y -= 1
	
	
	return velocity

func animate_player(velocity):
	var velocity_length = velocity.length()
	var velocity_angle = velocity.angle()
	# Convert it to degrees
	velocity_angle = rad2deg(velocity_angle)
	# Add 90 degrees since otherwise it treats going right as 0 degrees
	velocity_angle = velocity_angle + 90

	# If we're moving, change rotation
	if velocity.length() >= 1:
		rotation_degrees = velocity_angle

	

func _physics_process(delta):
	velocity = get_input()
	if Input.is_action_pressed("player_shoot"):
		if get_node("/root/main").magic!=0:
			if gun_timer.get_time_left() == 0:
				get_node("/root/main").magic-=1
				shoot()
	if Input.is_action_just_pressed("player_dash"):
		gun_timer.start()
		Force=main.dash_force
	
	
	
	animate_player(velocity)
	velocity = move_and_slide(velocity  * Speed * Force)

	
	
func shoot():
	gun_timer.start()
	active=true
	var b = bullet.instance()
	bullet_container.add_child(b)
	b.start_at(get_rotation(),get_node("muzzle").get_global_position())




	

func damage():
	if get_node("/root/main").health <=1:
		Save.load_game()
		
	else:
		get_node("/root/main").health-=1



func _on_Gun_timer_timeout():
	Force = 1
	active=false