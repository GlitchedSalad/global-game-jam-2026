extends Node2D

@onready var main_scene := "src/scenes/level/main.tscn"

func _on_play_button_pressed() -> void:
	Global.change_scene(main_scene)
