extends Node

var max_health : float
var current_health : float

signal death

func set_health(amount : float):
	current_health = amount
	clampf(current_health, 0, max_health)

func remove_health(amount : float):
	current_health -= amount
	clampf(current_health, 0, max_health)

func add_health(amount : float):
	current_health += amount
	clampf(current_health, 0, max_health)

func _process(_delta):
	if (current_health == 0):
		emit_signal("death")