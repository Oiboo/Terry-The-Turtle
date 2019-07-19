extends KinematicBody2D

onready var Player = get_parent().get_node("Player")
onready var timer1 = get_node("Freeze_timer")
onready var timer2 = get_node("Damage_timer")
var vel = Vector2(0,0)
var speed = 500
var react_time = 400
var dir = 0
var next_dir = 0
var next_dir_time = 0
var offset = 64
var eye_reach = 90
var vision = 600
var stop = false
var bite = false
signal damage

func _ready():
	add_to_group("enemy")


func sees_player():
	var eye_center = get_global_position()
	var eye_top = eye_center + Vector2(0, -eye_reach)
	var eye_left = eye_center + Vector2(-eye_reach, 0)
	var eye_right = eye_center + Vector2(eye_reach, 0)

	var player_pos = Player.get_global_position()
	var player_extents = Player.get_node("CollisionShape2D").shape.extents - Vector2(1, 1)
	var top_left = player_pos + Vector2(-player_extents.x, -player_extents.y)
	var top_right = player_pos + Vector2(player_extents.x, -player_extents.y)
	var bottom_left = player_pos + Vector2(-player_extents.x, player_extents.y)
	var bottom_right = player_pos + Vector2(player_extents.x, player_extents.y)

	var space_state = get_world_2d().direct_space_state

	for eye in [eye_center, eye_top, eye_left, eye_right]:
		for corner in [top_left, top_right, bottom_left, bottom_right]:
			if (corner - eye).length() > vision:
				continue
			var collision = space_state.intersect_ray(eye, corner, [], 1) # collision mask = sum of 2^(collision layers) - e.g 2^0 + 2^3 = 9
			if collision and collision.collider.name == "Player":
				return true
	return false
	
func set_dir(target_dir):
	if next_dir != target_dir:
		next_dir = target_dir
		next_dir_time = OS.get_ticks_msec() + react_time


func _physics_process(delta):
	if stop==true:
		if timer1.get_time_left() == 0:
			stop=false
			vision = 200
			get_node("Sprite").modulate = Color(1,1,1)
	#player is left
	if Player.position.x< position.x - offset and sees_player():
		set_dir(-1)
		
		#player is right
	elif Player.position.x> position.x + offset and sees_player():
		set_dir(1)
	else:
		set_dir(0)
	if OS.get_ticks_msec() > next_dir_time:
		dir = next_dir
		
	vel.x = dir * speed
	#player is up
	#if Player.position.y< position.y:
		#vel.y= -speed
		#player is down
	#if Player.position.y> position.y:
		#vel.y = speed
		
	vel = move_and_slide(vel,Vector2(0,1))
	if (get_slide_count()>0):
		var collider = self.get_slide_collision(0).collider
		if collider == Player:
			if bite==false:
				timer2.start()
				emit_signal("damage")
				bite=true
			if timer2.get_time_left() == 0 and bite==true:
				emit_signal("damage")
				
				bite=false
			else :
				pass
	
	
	

func freeze():
	vision = 0
	dir = 0
	timer1.start()
	stop=true
	get_node("Sprite").modulate = Color(1,0,0)
	