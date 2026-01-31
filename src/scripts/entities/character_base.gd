class_name CharacterBase extends Node2D

@export var controller : Node
@export var attack1: Attack
var direction: Vector2

var health: HealthComponent


func _ready() -> void:
	controller = get_node("CharController")
	controller.move.connect(_on_controller_move)
	attack1 = get_node("Attack1")
	controller.attack1.connect(_on_attack1)
	direction = Vector2.RIGHT
	
	health = get_node_or_null("HealthComponent")
	if (health is HealthComponent):
		health.health_depleted.connect(_on_health_depleted)

func _on_controller_move(vec : Vector2):
	global_position += vec
	if vec.length() > 0 : 
		direction = vec

func _on_attack1():
	attack1.attack(direction)
	
func _on_health_depleted():
	print("dead")
