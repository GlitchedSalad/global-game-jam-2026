extends TextureRect

var loop = 0.0 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	loop += delta
	position = 10.0 * Vector2(cos(loop) - 20, -sin(loop) - 20)
