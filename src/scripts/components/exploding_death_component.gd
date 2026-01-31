extends DeathComponent

@export var explosionScene: PackedScene
var hit_layers: Array[int] = [1]

func die():
	var explosion = explosionScene.instantiate()
	
	if (explosion is DeathExplosion):
		explosion.global_position = global_position
		explosion.hit_layers = hit_layers
		get_tree().root.add_child.call_deferred(explosion)
	
	died.emit()
