class_name ProjectileSpawner
extends Node2D

@export var ProjectileScene: PackedScene

func spawn_projectile(direction: Vector2, hit_layers: Array[int]):
	var projectile = ProjectileScene.instantiate()
	
	if (projectile is Projectile):
		projectile.initialize(direction, global_position, hit_layers)
		get_tree().root.add_child.call_deferred(projectile)
