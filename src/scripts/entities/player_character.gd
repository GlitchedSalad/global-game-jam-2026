class_name Player
extends CharacterBase

func _ready():
	hit_layers = [1]
	attack_layers = [0]
	super._ready()

func add_xp(xp: int):
	print("add me some xp")

func _on_died():
	pass
