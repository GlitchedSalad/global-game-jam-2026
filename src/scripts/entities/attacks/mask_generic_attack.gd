extends Attack


func attack(direction: Vector2, hit_layers: Array[int]) -> void:
	$ProjectileSpawner.spawn_projectile(direction, hit_layers)
	print("mask attack")
	

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
