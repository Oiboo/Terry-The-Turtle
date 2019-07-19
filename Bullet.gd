extends Area2D

var vel = Vector2()
export var speed = 500




func start_at(dir, pos):
	set_rotation(dir)
	set_position(pos)
	vel = Vector2(speed, 0).rotated(dir - PI/2)

func _physics_process(delta):
	set_position(get_position() + vel * delta)
 



func _on_Timer_timeout():
		queue_free()


func _on_Bullet_body_entered(body):
	if body.get_groups().has("blocker"):
		queue_free()
		body.damage()
		if body.health <= 0:
			body.explode()
		
	if body.get_groups().has("switch"):
		queue_free()
		body.switch()
	if body.get_groups().has("enemy"):
		queue_free()
		body.freeze()
	