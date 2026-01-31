class_name Player
extends CharacterBase
@export var equipped_mask: Mask
func _ready():
	hit_layers = [1]
	attack_layers = [0]
	super._ready()
	
	if equipped_mask:
		equipped_mask.apply_to_controller(controller)
		var instance = equipped_mask.special_attack.instantiate()
		instance.name = "Special"
		add_child(instance)
		special = instance
		setup_listeners() 

func add_xp(xp: int):
	Global.add_points(xp)

func _on_died():
	pass
