extends Node2D

@onready var main_scene := "src/scenes/level/main.tscn"
@onready var help_scene := "src/scenes/level/HelpPage.tscn"

func _ready() -> void:
	pass

func _on_help_button_pressed() -> void:
	Global.change_scene(help_scene)

func _on_quit_button_pressed() -> void:
	get_tree().quit()

func _on_play_button_pressed() -> void:
	Global.change_scene(main_scene)
