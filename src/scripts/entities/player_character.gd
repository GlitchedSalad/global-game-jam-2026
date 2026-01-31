class_name Player
extends "res://src/scripts/entities/character_base.gd"

@export var shield_node : Node
@export var player_number = 1
func _ready() -> void:
	controller.shield.connect(_on_controller_shield)
	controller.move.connect(_on_controller_move)
	controller.attack1.connect(_on_attack1)
	add_to_group("player")

func add_xp(xp: int):
	print("add me some xp")

func _on_controller_shield():
	print("shield . do_something")

func _on_health_changed(health: int):
	print(health)
