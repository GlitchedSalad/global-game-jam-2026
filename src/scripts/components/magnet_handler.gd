extends Area2D
@export var size: int = 1:
	set(value):
		size = value
		_on_size_change()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("magnet")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _on_size_change():
	var child = get_node("CollisionShape2D")
	child.scale = Vector2(size, size)
