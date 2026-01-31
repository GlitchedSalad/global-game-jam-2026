extends Node2D

@onready var player = get_tree().get_first_node_in_group("player")

@export var speed := 100.0
@export var attack_time := 0.2
@export var min_attack_distance := 100.0
var direction : Vector2

@onready var timer := $Timer

signal move(value : Vector2)
signal shield
signal attack1
signal attack2
signal special

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.wait_time = attack_time
	timer.start()
	timer.timeout.connect(_on_attack_timer_timeout)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if player == null:
		return

	direction = global_position.direction_to(player.global_position)
	emit_signal("move", direction * speed * delta)



func _on_attack_timer_timeout():
	if ((global_position - player.global_position).length() < min_attack_distance):
		attack1.emit()
