extends Control

onready var health_bar = $Health_bar

func _on_health_updated(health,amount):
	health_bar.value = health
	