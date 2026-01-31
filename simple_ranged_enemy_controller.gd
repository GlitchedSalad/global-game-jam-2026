extends Node2D

@onready var player : Node2D = get_tree().get_first_node_in_group("player")

@export var speed := 100.0
@export var range := 30.0
var direction : Vector2

signal move(value : Vector2)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if (player == null):
		printerr("RangedEnemyController: missing player reference.")
		return


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if player == null:
		return
	direction = global_position.direction_to(player.global_position)
	if ((global_position - player.global_position).length() > range):
		emit_signal("move", direction * speed * delta)