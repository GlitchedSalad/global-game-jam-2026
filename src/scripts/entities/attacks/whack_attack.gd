extends Attack

var hurtbox: HurtboxComponent
var sprite: AnimatedSprite2D

func _ready():
	sprite = get_node("Sprite2D")
	hurtbox = get_node("HurtboxComponent")
	sprite.visible = false

func attack(direction: Vector2, hit_layers: Array[int]) -> void:
	sprite.visible = true
	sprite.play()
	for area in hurtbox.get_overlapping_areas():
		if area == HitboxComponent:
			area.damage_within_hitbox(hurtbox.damage_amount)
	await sprite.animation_finished
	sprite.visible = false
