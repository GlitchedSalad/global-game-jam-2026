extends Node

# Global tracking variables
var enemy_kills : int = 0
var points : int = 0
var Health_1 : int = 100
var Health_2 : int = -99 #set to -99 to diasable

signal points_changed
signal player_1_health_change
signal player_2_health_change

func _ready():
	process_mode = PROCESS_MODE_ALWAYS

func add_points(amount : int):
	points += amount
	points_changed.emit()


func update_health_1(health : int):
	Health_1 = health
	player_1_health_change.emit()


func update_health_2(health : int):
	Health_2 = health
	player_2_health_change.emit()

# Global functions

func change_scene(scene_pointer : String):
	get_tree().change_scene_to_file(scene_pointer)

func pause():
	get_tree().paused = not get_tree().paused
