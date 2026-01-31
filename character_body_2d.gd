extends CharacterBody2D

var speed := 1000

var up_input = "Up"
var down_input = "Down"
var left_input = "Left"
var right_input = "Right"



func _physics_process(delta: float):
	velocity.y = 100 * Input.get_axis(up_input,down_input)
	velocity.x = 100 * Input.get_axis(left_input,right_input)
	
	move_and_slide()
