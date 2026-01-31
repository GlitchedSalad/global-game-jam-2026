extends DeathComponent

@export var xp: int

func die():
	var xp_orb = Pickup
	xp_orb.xp = xp
	xp_orb.position = global_position
	get_tree().root.add_child(xp_orb)
