class_name HealthBarComponent extends Node2D

@export var health_component: HealthComponent
@export var width: int = 100:
	set(value):
		width = value
		queue_redraw()
@export var height: int = 10:
	set(value):
		height = value
		queue_redraw()
@export var show_health_text: bool

func _ready() -> void:
	if (health_component == null):
		printerr("HealthBarComponent: healthComponent is not assigned.")
		return
	
	health_component.health_changed.connect(_on_health_changed)

func _draw() -> void:
	if (health_component == null):
		return
	
	var health_percent: float = health_component.current_health / health_component.max_health
	var bg_color = Color(0.2, 0.2, 0.2)
	var fg_color = Color(1.0, 0.0, 0.0)
	
	draw_rect(Rect2(Vector2(-width / 2, 0), Vector2(width, height)), bg_color)
	draw_rect(Rect2(Vector2(-width / 2, 0), Vector2(width * health_percent, height)), fg_color)

func _on_health_changed():
	queue_redraw()
