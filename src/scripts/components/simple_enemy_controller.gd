extends Node2D

@onready var player = get_tree().get_first_node_in_group("player")

@export var speed := 100
var direction : Vector2

signal move(value : Vector2)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if player == null:
		return

	direction = global_position.direction_to(player.global_position)
	emit_signal("move", direction * speed * delta)



