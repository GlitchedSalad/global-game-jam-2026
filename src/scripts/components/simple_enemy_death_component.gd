extends DeathComponent

@export var xp: int = 10
var effect: GPUParticles2D
var deathTimer:= Timer.new()

func _ready() -> void:
	effect = get_node("DeathEffect")

func die():
	#var xp_orb = Pickup
	#xp_orb.xp = xp
	#xp_orb.position = global_position
	#get_tree().root.add_child(xp_orb)
	print("dying")
	effect.emitting = true
	await effect.finished
	died.emit()
