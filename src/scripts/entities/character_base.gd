class_name CharacterBase
extends Node2D

var controller : Node
var health: HealthComponent
var death: DeathComponent

var attack1: Attack
var attack2: Attack
var special: Attack
var shield

var direction: Vector2


func _ready() -> void:
	direction = Vector2.RIGHT
	
	controller = get_node_or_null("CharController")
	if (controller != null):
		controller.move.connect(_on_controller_move)
	
	health = get_node_or_null("HealthComponent")
	if (health is HealthComponent):
		health.health_depleted.connect(_on_health_depleted)
	
	death = get_node_or_null("DeathComponent")
	if (death is DeathComponent):
		death.died.connect(_on_died)
	
	attack1 = get_node_or_null("Attack1")
	if (attack1 is Attack):
		controller.attack1.connect(_on_attack1)
	
	attack2 = get_node_or_null("Attack2")
	if (attack2 is Attack):
		controller.attack2.connect(_on_attack2)
	
	special = get_node_or_null("Special")
	if (special is Attack):
		controller.special.connect(_on_special)
	
	shield = get_node_or_null("Shield")
	if (shield is Attack):
		controller.shield.connect(_on_shield)

func _on_controller_move(vec : Vector2):
	global_position += vec
	if vec.length() > 0 : 
		direction = vec

func _on_attack1():
	attack1.attack(direction)

func _on_attack2():
	attack2.attack(direction)

func _on_special():
	special.attack(direction)

func _on_shield():
	pass

func _on_health_depleted():
	print("health gone")

func _on_died():
	print("died")
