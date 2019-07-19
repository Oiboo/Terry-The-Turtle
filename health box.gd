extends Area2D

var need = 5
onready var scene = preload("res://Health.tscn")


func _ready():
	pass



func _on_Health_box_body_entered(body):
	if body.name == "Player":
		if get_node("/root/main").score >= need:
			get_node("/root/main").score-=need
			var s = scene.instance()
			add_child(s)
			#queue_free()
