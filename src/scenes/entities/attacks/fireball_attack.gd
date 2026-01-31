extends Attack

@export var fireball_spawner: ProjectileSpawner

func _ready() -> void:
	fireball_spawner = get_node("ProjectileSpawner")

func attack(direction: Vector2) -> void:
	fireball_spawner.spawn_projectile(direction)	
