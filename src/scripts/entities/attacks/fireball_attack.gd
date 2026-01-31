extends Attack

@export var fireball_spawner: ProjectileSpawner

func _ready() -> void:
	fireball_spawner = get_node("ProjectileSpawner")

func attack(direction: Vector2, hit_layers: Array[int]) -> void:
	fireball_spawner.spawn_projectile(direction, hit_layers)	
