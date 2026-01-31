class_name Pickup
extends Node2D

@export var xp: int = 10
var magnet_pull := 300
var target: Node2D = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("xp_orbs")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if target:
		global_position = global_position.move_toward(target.global_position,magnet_pull * delta)


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("magnet"):
		target = area
		return
	var player = area.get_parent()
	if player.is_in_group("player"):
		player.add_xp(10)
		queue_free()
