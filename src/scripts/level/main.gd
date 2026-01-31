extends Node2D

var run_time := 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	run_time += delta

	var new_difficulty: float = min(
		Global.difficulty_start + (run_time * Global.difficulty_growth_per_sec),
		Global.difficulty_cap
	)

	if new_difficulty != Global.difficulty:
		Global.difficulty = new_difficulty
		Global.difficulty_changed.emit()
