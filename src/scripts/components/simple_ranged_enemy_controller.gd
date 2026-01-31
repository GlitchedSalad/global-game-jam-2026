extends Node2D

@onready var player : Node2D = get_tree().get_first_node_in_group("player")

@export var speed := 30.0
@export var attack_range := 300.0

var direction : Vector2

signal move(value : Vector2)
signal shield
signal attack1
signal attack2
signal special

func _ready() -> void:
	if (player == null):
		printerr("RangedEnemyController: missing player reference.")
		return

func _process(delta: float) -> void:
	if player == null:
		return
	direction = global_position.direction_to(player.global_position)
	if ((global_position - player.global_position).length() > attack_range):
		emit_signal("move", direction * speed * delta)