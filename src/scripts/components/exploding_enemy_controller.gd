extends Node2D

@export var speed := 60.0
@export var min_attack_distance := 100.0
var direction : Vector2
@onready var players : Array = get_tree().get_nodes_in_group("player")

signal move(value : Vector2)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	direction = global_position.direction_to(players[0].global_position)
	emit_signal("move", direction * speed)
