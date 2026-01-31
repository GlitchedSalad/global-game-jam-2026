class_name Player
extends CharacterBase

@export var shield_node : Node

func _ready() -> void:
	controller.shield.connect(_on_controller_shield)
	controller.move.connect(_on_controller_move)
	controller.attack1.connect(_on_attack1)
	controller.attack2.connect(_on_attack2)

func add_xp(xp: int):
	print("add me some xp")

func _on_controller_shield():
	print("shield . do_something")
