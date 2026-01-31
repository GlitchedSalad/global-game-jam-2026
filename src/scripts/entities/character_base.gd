extends Node2D

@export var controller : Node
@export var shield_node : Node
@export var attack1: Attack
var direction: Vector2


func _ready() -> void:
	controller = get_node("CharController")
	controller.move.connect(_on_controller_move)
	#controller.shield.connect(_on_controller_shield)
	attack1 = get_node("Attack1")
	controller.attack1.connect(_on_attack1)
	direction = Vector2.RIGHT


func _process(delta: float) -> void:
	pass

func _on_controller_move(vec : Vector2):
	global_position += vec
	direction = vec

func _on_controller_shield():
	print("shield . do_something")
	pass

func add_xp(xp: int):
	print("add me some xp")
	pass
	
func _on_attack1():
	attack1.attack(direction)
	print(direction)
