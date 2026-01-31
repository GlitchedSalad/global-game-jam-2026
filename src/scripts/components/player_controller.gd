extends Node
@export var player = 0

@export var speed := 100

@export var death_component: DeathComponent

var direction : Vector2

signal move(value : Vector2)
signal shield
signal attack1
signal attack2
signal special

#default binds
var up_input = "Up"
var down_input = "Down"
var left_input = "Left"
var right_input = "Right"
var sheild_input = "G"
var attack1_input = "Y"
var attack2_input = "J"
var special_input = "H"
func _ready() -> void:
	if(player == 0):
		up_input = "Up"
		down_input = "Down"
		left_input = "Left"
		right_input = "Right"
		sheild_input = "ARROW_UP"
		attack1_input = "ARROW_LEFT"
		attack2_input = "ARROW_RIGHT"
		special_input = "ARROW_DOWN"
	if(player == 1):
		up_input = "Up"
		down_input = "Down"
		left_input = "Left"
		right_input = "Right"
		sheild_input = "G"
		attack1_input = "Y"
		attack2_input = "J"
		special_input = "H"
	if(player == 2):
		up_input = "ARROW_UP"
		down_input = "ARROW_DOWN"
		left_input = "ARROW_LEFT"
		right_input = "ARROW_RIGHT"
		sheild_input = "NUM_UP"
		attack1_input = "NUM_LEFT"
		attack2_input = "NUM_RIGHT"
		special_input = "NUM_DOWN"


func _process(delta: float) -> void:
	direction.y = Input.get_axis(up_input,down_input)
	direction.x = Input.get_axis(left_input,right_input)
	emit_signal("move", speed * direction * delta)

	if Input.is_action_just_pressed(sheild_input):
		emit_signal("shield")
	if Input.is_action_just_pressed(attack1_input):
		emit_signal("attack1")
	if Input.is_action_just_pressed(attack2_input):
		emit_signal("attack2")
	if Input.is_action_just_pressed(special_input):
		emit_signal("special")
		
