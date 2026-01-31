extends Attack

## Add Tank Attack Spawner
@export var projectile_spawner : Node2D

var attack_range := 300.0
var attack_amount := 5

func attack(direction: Vector2, hit_layers: Array[int]) -> void:
	await get_tree().create_timer(1).timeout
	var pos : Vector2
	for i in attack_amount:
		pos = global_position + (i * direction * 4)
		projectile_spawner.spawn_projectile(pos, hit_layers)
		await get_tree().create_timer(0.1).timeout
