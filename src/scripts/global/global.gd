extends Node

# Global tracking variables
var enemy_kills : int = 0
var points : int = 0

signal points_changed

func _ready():
	process_mode = PROCESS_MODE_ALWAYS

func add_points(amount : int):
	points += amount
	points_changed.emit()

# Global functions

func change_scene(scene_pointer : String):
	get_tree().change_scene_to_file(scene_pointer)

func pause():
	get_tree().paused = not get_tree().paused
