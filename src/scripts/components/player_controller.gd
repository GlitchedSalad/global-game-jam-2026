extends Node
@export var player = 0

@export var speed := 100
var direction : Vector2

signal move(value : Vector2)
signal shield
signal attack1
signal attack2
signal special

func _ready() -> void:
	pass


func _process(delta: float) -> void:
	direction.y = Input.get_axis("Up","Down")
	direction.x = Input.get_axis("Left","Right")
	emit_signal("move", speed * direction * delta)

	if Input.is_action_just_pressed("G"):
		emit_signal("shield")
	if Input.is_action_just_pressed("Y"):
		emit_signal("attack1")
	if Input.is_action_just_pressed("J"):
		emit_signal("attack2")
	if Input.is_action_just_pressed("H"):
		emit_signal("special")
