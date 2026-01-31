extends Node2D

@onready var timer : Node = $Timer

@export var melee_enemy : PackedScene
@export var ranged_enemy : PackedScene
@export var tank_enemy : PackedScene
@export var bounds_min: Vector2 = Vector2(-960, -540)
@export var bounds_max: Vector2 = Vector2( 960,  540)

@export var enemy_padding: float = 32.0 # keep enemies away from exact edge

var players : Array
var spawn_wave_time := 10.0
var spawn_offset := 0.5
var spawn_amount := 5
var spawn_radius := 1000.0

func _ready() -> void:
	players = get_tree().get_nodes_in_group("player")
	timer.wait_time = spawn_wave_time
	timer.start()
	timer.timeout.connect(_on_spawn_timer)


func _on_spawn_timer():
	for n in spawn_amount:
		var target = players[randi_range(0, players.size() - 1)]

		var new_enemy

		match randi_range(0, 9):
			0:
				# Make him spawn when difficulty increaces
				new_enemy = tank_enemy.instantiate()
			1, 2, 3, 4, 5:
				new_enemy = melee_enemy.instantiate()
			6, 7, 8, 9:
				new_enemy = ranged_enemy.instantiate()
		
		#new_enemy.global_position = target.global_position + Vector2(spawn_radius, 0).rotated(randf_range(0, 2 * PI))
		new_enemy.global_position = boundary_spawn(target.global_position)
		get_tree().root.add_child.call_deferred(new_enemy)
		await get_tree().create_timer(spawn_offset).timeout
	
## spawn within the boundry walls
func boundary_spawn(center: Vector2) -> Vector2:
	# 1) pick a point on a circle around the player
	var angle := randf_range(0.0, TAU)
	var pos := center + Vector2(spawn_radius, 0).rotated(angle)

	# 2) clamp inside the rectangle bounds (with padding)
	pos.x = clamp(pos.x, bounds_min.x + enemy_padding, bounds_max.x - enemy_padding)
	pos.y = clamp(pos.y, bounds_min.y + enemy_padding, bounds_max.y - enemy_padding)

	return pos
