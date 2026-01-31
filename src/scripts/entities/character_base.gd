extends Node2D

@export var controller : Node
@export var shield_node : Node


func _ready() -> void:
	controller.move.connect(_on_controller_move)
	#controller.shield.connect(_on_controller_shield)


func _process(delta: float) -> void:
	pass

func _on_controller_move(vec : Vector2):
	global_position += vec

func _on_controller_shield():
	print("shield . do_something")
	pass

func add_xp(xp: int):
	print("add me some xp")
	pass
