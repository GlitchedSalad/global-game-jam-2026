extends Projectile

@export var speed = 2000
@export var life_duration = 3.0
var direction: Vector2
var hurtbox: HurtboxComponent
var hitEffect: GPUParticles2D
var lifeTimer:= Timer.new()
var sprite: Sprite2D

func initialize(direction: Vector2, position: Vector2) -> void:
	sprite = get_node("Sprite2D")
	hurtbox = get_node("HurtboxComponent")
	hurtbox.hurtbox_hit.connect(_on_hurtbox_hit)
	hitEffect = get_node("HitEffect")
	self.position = position
	self.direction = direction.normalized()
	lifeTimer.wait_time = 3.0
	lifeTimer.one_shot = true
	lifeTimer.timeout.connect(queue_free)
	add_child(lifeTimer)
	lifeTimer.autostart = true
	

func _process(delta: float) -> void:
	position += direction * speed * delta

func _on_hurtbox_hit(hitbox: HitboxComponent):
	sprite.visible = false
	hurtbox.set_deferred("Monitoring", false)
	lifeTimer.stop()
	lifeTimer.wait_time = hitEffect.lifetime
	lifeTimer.start()
