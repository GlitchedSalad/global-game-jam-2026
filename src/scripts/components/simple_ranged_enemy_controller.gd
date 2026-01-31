extends Node2D

@export var speed := 40.0
@export var attack_range := 300.0
@export var attack_time := 2.0

@onready var timer := $Timer
@onready var players : Array = get_tree().get_nodes_in_group("player")

var direction : Vector2

signal move(value : Vector2)
signal shield
signal attack1
signal attack2
signal special

func _ready() -> void:
	
	timer.wait_time = attack_time
	timer.start()
	timer.timeout.connect(_on_attack_timer_timeout)
	

func _process(delta: float) -> void:

	direction = global_position.direction_to(players[0].global_position)
	if ((global_position - players[0].global_position).length() > attack_range):
		emit_signal("move", direction * speed * delta)
	else:
		emit_signal("move", direction * delta)

func _on_attack_timer_timeout():
	attack1.emit()
