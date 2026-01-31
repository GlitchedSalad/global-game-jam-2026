class_name CharacterBase
extends CharacterBody2D

var controller : Node
var health: HealthComponent
var hitbox: HitboxComponent
var death: DeathComponent

var attack1
var attack2
var special
var shield

var can_act: bool = true
var direction: Vector2
var hit_layers: Array[int] = [0]
var attack_layers: Array[int] = [1]


func _ready() -> void:
	direction = Vector2.RIGHT
	
	controller = get_node_or_null("CharController")
	if (controller != null):
		controller.move.connect(_on_controller_move)
	
	health = get_node_or_null("HealthComponent")
	if (health is HealthComponent):
		health.health_depleted.connect(_on_health_depleted)
	
	hitbox = get_node_or_null("HitboxComponent")
	if (hitbox is HitboxComponent):
		hitbox.collision_layer = 0
		hitbox.collision_mask = 0
		for i in range(len(hit_layers)):
			hitbox.set_collision_layer_value(hit_layers[i] + 1, true)
			hitbox.set_collision_mask_value(hit_layers[i] + 1, true)
	
	death = get_node_or_null("DeathComponent")
	if (death is DeathComponent):
		death.died.connect(_on_died)
	setup_listeners()


func setup_listeners() -> void:
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

func _physics_process(_delta: float) -> void:
	move_and_slide()

func _on_controller_move(vec : Vector2):
	if (!can_act): return
	velocity = vec
	if vec.length() > 0 : 
		direction = vec

func _on_attack1():
	if (!can_act): return
	attack1.attack(direction, attack_layers)

func _on_attack2():
	if (!can_act): return
	attack2.attack(direction, attack_layers)

func _on_special():
	if (!can_act): return
	special.attack(direction, attack_layers)

func _on_shield():
	if (!can_act): return
	pass

func _on_health_depleted():
	can_act = false
	velocity = Vector2.ZERO
	if (death is DeathComponent):
		death.die()

func _on_died():
	queue_free()
