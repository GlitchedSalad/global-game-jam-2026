extends Node2D

@export var controller : Node


func _ready() -> void:
	controller.move.connect(_on_controller_move)


func _process(delta: float) -> void:
	pass

func _on_controller_move(vec : Vector2):
	global_position += vec
