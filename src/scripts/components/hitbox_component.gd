class_name HitboxComponent extends Area2D

@export var health_component: HealthComponent

signal hitbox_hit(hurtbox_component: HurtboxComponent)

func _on_area_entered(area: Area2D) -> void:
	if (area is HurtboxComponent):
		health_component.remove_health(area.damage_amount)
		hitbox_hit.emit(area)
		#print(area.collision_layer, area.collision_mask, collision_layer, collision_mask)
		
func damage_within_hitbox(amount : float):
	health_component.remove_health(amount)
