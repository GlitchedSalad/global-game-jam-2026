class_name HealthComponent extends Node

@export var max_health : float = 100
var current_health : float

signal health_depleted
signal health_changed()

func _ready() -> void:
	set_current_health(max_health)

func set_current_health(amount : float) -> void:
	current_health = amount
	current_health = clampf(current_health, 0, max_health)
	health_changed.emit()
	
func set_max_health(amount: float, full: bool) -> void:
	max_health = maxf(1.0, amount)
	if (full):
		set_current_health(max_health)
	health_changed.emit()

func remove_health(amount : float) -> void:
	current_health -= amount
	if (current_health <= 0):
		health_depleted.emit()
	current_health = clampf(current_health, 0, max_health)
	health_changed.emit()

func add_health(amount : float) -> void:
	current_health += amount
	current_health = clampf(current_health, 0, max_health)
	health_changed.emit()
	
