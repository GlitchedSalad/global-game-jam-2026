extends Node

# Global tracking variables
var enemy_kills : int = 0
var points : int = 0
var Health_1 : int = 100
var Health_2 : int = -99 #set to -99 to diasable
var run_time: float = 0.0
var difficulty: float = 1.0

# Base difficulty values
@export var difficulty_start: float = 1.0
@export var difficulty_growth_per_sec: float = 0.02
@export var difficulty_cap: float = 30.0

signal difficulty_changed
signal points_changed
signal player_1_health_change
signal player_2_health_change

func _ready():
	process_mode = PROCESS_MODE_ALWAYS
	difficulty = difficulty_start

func add_points(amount : int):
	points += amount
	points_changed.emit()

func update_health_1(health : int):
	Health_1 = health
	player_1_health_change.emit()

func update_health_2(health : int):
	Health_2 = health
	player_2_health_change.emit()

func get_difficulty() -> float:
	return difficulty

# Global functions

func change_scene(scene_pointer : String):
	get_tree().change_scene_to_file(scene_pointer)

func pause():
	get_tree().paused = not get_tree().paused
