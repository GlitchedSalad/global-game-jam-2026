extends Node2D

var range := 300.0
var attack_amount := 5

func attack(direction: Vector2, hit_layers: Array[int]) -> void:
	sprite.visible = true
	sprite.play()
	for area in hurtbox.get_overlapping_areas():
		if area == HitboxComponent:
			area.damage_within_hitbox(hurtbox.damage_amount)
	await sprite.animation_finished
	sprite.visible = false
