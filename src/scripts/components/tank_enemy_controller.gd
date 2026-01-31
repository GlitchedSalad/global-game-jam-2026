extends Node2D


@export var speed := 30.0
@export var attack_time := 5.0
@export var min_attack1_distance := 1000.0
@export var min_attack2_distance := 200.0
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
func _process(_delta: float) -> void:
	direction = global_position.direction_to(players[0].global_position)
	emit_signal("move", direction * speed)



func _on_attack_timer_timeout():
	var dist_to_player = (global_position - players[0].global_position).length()
	if (dist_to_player < min_attack1_distance):
		if (dist_to_player < min_attack2_distance):
			attack2.emit()
		else:
			attack1.emit()
