extends Attack

var hurtbox: HurtboxComponent
var sprite: AnimatedSprite2D

func _ready():
	sprite = get_node("Sprite2D")
	hurtbox = get_node("HurtboxComponent")
	sprite.visible = false
	

func attack(direction: Vector2) -> void:
	sprite.visible = true
	sprite.play()
	for area in hurtbox.get_overlapping_areas():
		#area.take_damage()
		pass
	await sprite.animation_finished
	sprite.visible = false
