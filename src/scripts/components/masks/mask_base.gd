class_name Mask
extends Resource 
@export var speed_multiplier: float = 1.0
@export var regen_multiplier: float = 1.0
@export var damage_multiplier: float = 1.0
@export var dash_multiplier: float = 1.0
@export var special_attack: PackedScene
func apply_to_controller(controller: Node) -> void:
	if "speed" in controller:
		controller.speed *= speed_multiplier
