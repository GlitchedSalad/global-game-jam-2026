extends Node


@export var speed := 100
var direction : Vector2

signal move(value : Vector2)

func _ready() -> void:
	pass


func _process(delta: float) -> void:
	direction.y = Input.get_axis("Up","Down")
	direction.x = Input.get_axis("Left","Right")
	emit_signal("move", speed * direction * delta)

