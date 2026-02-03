extends DeathComponent

@export var xp: int = 10
@export var xpScene: PackedScene
@export var hitbox : Node
var effect: GPUParticles2D

func _ready() -> void:
	effect = get_node("DeathEffect")

func die():
	var xp_orb = xpScene.instantiate()
	if (hitbox != null):
		hitbox.set_deferred("monitoring", false)


	if (xp_orb is Pickup):
		xp_orb.xp = xp
		xp_orb.global_position = global_position
		get_tree().root.add_child.call_deferred(xp_orb)
	effect.emitting = true
	await effect.finished
	died.emit()
