extends Node2D

@onready var timer : Node = $Timer

@export var melee_enemy : PackedScene
@export var ranged_enemy : PackedScene

var players : Array
var spawn_time := 3.0
var spawn_amount := 5
var spawn_radius := 1000.0

func _ready() -> void:
	players = get_tree().get_nodes_in_group("player")
	timer.wait_time = spawn_time
	timer.start()
	timer.timeout.connect(_on_spawn_timer)


func _on_spawn_timer():
	for n in spawn_amount:
		var target = players[randi_range(0, players.size() - 1)]

		var new_enemy

		if randi_range(0,1):
			new_enemy = melee_enemy.instantiate()
		else:
			new_enemy = ranged_enemy.instantiate()
		
		new_enemy.global_position = target.global_position + Vector2(spawn_radius, 0).rotated(randf_range(0, 2 * PI))
		get_tree().root.add_child.call_deferred(new_enemy)
	
