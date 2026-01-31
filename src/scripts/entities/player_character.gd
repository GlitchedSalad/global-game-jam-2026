class_name Player
extends CharacterBase
@export var equipped_mask: Mask
func _ready():
	hit_layers = [1]
	attack_layers = [0]
	super._ready()
	
	if equipped_mask:
		print("fuck")
		equipped_mask.apply_to_controller(controller)
#		special = equipped_mask.special_attack.instantiate()

func add_xp(xp: int):
	print("add me some xp")

func _on_died():
	pass
