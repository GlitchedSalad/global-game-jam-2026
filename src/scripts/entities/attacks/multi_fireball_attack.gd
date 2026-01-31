extends Attack

@export var fireball_spawner: ProjectileSpawner
@export var fireball_number: int = 8

func _ready() -> void:
	fireball_spawner = get_node("ProjectileSpawner")

func attack(direction: Vector2, hit_layers: Array[int]) -> void:
	fireball_spawner.spawn_projectile(direction, hit_layers)
	for i in range(fireball_number):
		var angle = direction.angle() + (i * 2 * PI / fireball_number)
		fireball_spawner.spawn_projectile(Vector2.RIGHT.rotated(angle), hit_layers)
