extends Projectile

@export var speed = 1000
@export var life_duration = 1.0
var direction: Vector2
var hurtbox: HurtboxComponent
var hitEffect: GPUParticles2D
var lifeTimer:= Timer.new()
var sprite: AnimatedSprite2D

func initialize(_direction: Vector2, _position: Vector2) -> void:
	sprite = get_node("Sprite2D")
	hurtbox = get_node("HurtboxComponent")
	hurtbox.hurtbox_hit.connect(_on_hurtbox_hit)
	hitEffect = get_node("HitEffect")
	self.position = _position
	self.direction = _direction.normalized()
	lifeTimer.wait_time = 3.0
	lifeTimer.one_shot = true
	lifeTimer.timeout.connect(queue_free)
	add_child(lifeTimer)
	lifeTimer.autostart = true
	sprite.play()
	sprite.rotation = _direction.angle()
	

func _process(delta: float) -> void:
	position += direction * speed * delta

func _on_hurtbox_hit(hitbox: HitboxComponent):
	sprite.visible = false
	hurtbox.set_deferred("Monitoring", false)
	lifeTimer.stop()
	lifeTimer.wait_time = hitEffect.lifetime
	lifeTimer.start()
