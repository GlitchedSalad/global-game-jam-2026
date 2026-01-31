class_name Player
extends "res://src/scripts/entities/character_base.gd"

@export var shield_node : Node

func _ready() -> void:
	controller.shield.connect(_on_controller_shield)

func add_xp(xp: int):
	print("add me some xp")

func _on_controller_shield():
	print("shield . do_something")