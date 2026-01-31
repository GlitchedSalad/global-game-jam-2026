extends Node2D


@export var speed := 60.0
@export var attack_time := 0.2
@export var min_attack_distance := 100.0
var direction : Vector2
@onready var players : Array = get_tree().get_nodes_in_group("player")

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
	direction = global_position.direction_to(players[0].global_position)
	emit_signal("move", direction * speed * delta)



func _on_attack_timer_timeout():
	if ((global_position - players[0].global_position).length() < min_attack_distance):
		attack1.emit()
