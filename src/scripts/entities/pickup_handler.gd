class_name Pickup
extends Node2D

@export var xp: int = 10

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("xp_orbs")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_area_entered(area: Area2D) -> void:
	var player = area.get_parent()
	if player.is_in_group("player"):
		player.add_xp(10)
		queue_free()
