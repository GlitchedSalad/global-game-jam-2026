class_name Player
extends "res://src/scripts/entities/character_base.gd"

@export var shield : Node

func _ready() -> void:
	shield = get_node("Shield")
	controller.shield.connect(_on_shield)
	controller.move.connect(_on_controller_move)
	controller.attack1.connect(_on_attack1)
	controller.attack2.connect(_on_attack2)

func add_xp(xp: int):
	print("add me some xp")

func _on_shield():
	print("shield . do_something")
