class_name HurtboxComponent extends Area2D

@export var damage_amount: float

signal hurtbox_hit(hitbox_component: HitboxComponent)

func _on_area_entered(area: Area2D) -> void:
	if (area is HitboxComponent):
		hurtbox_hit.emit(area)
