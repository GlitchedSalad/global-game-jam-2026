class_name DeathExplosion
extends Node2D

var hit_layers: Array[int] = [1]
var hurtbox: HurtboxComponent
var effectTimer: Timer = Timer.new()
var sprite: AnimatedSprite2D

func _ready() -> void:
	hurtbox = get_node("HurtboxComponent")
	hurtbox.collision_layer = 0
	hurtbox.collision_mask = 0
	for i in range(len(hit_layers)):
		hurtbox.set_collision_layer_value(hit_layers[i] + 1, true)
		hurtbox.set_collision_mask_value(hit_layers[i] + 1, true)
	sprite = get_node("AnimatedSprite2D")
	sprite.play()
	sprite.animation_finished.connect(queue_free)
