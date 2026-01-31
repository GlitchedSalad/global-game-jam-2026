extends CanvasLayer

@onready var points_label := $Points
@onready var player_1_health_label := $player_1_health
@onready var player_2_health_label := $player_2_health

func _ready() -> void:
	Global.connect("points_changed", _on_points_changed)
	Global.connect("player_1_health_change", _on_player_1_health_change)
	Global.connect("player_1_health_change", _on_player_2_health_change)
	points_label.text = ("Points: " + str(Global.points))
	player_1_health_label.text = ("Player 1 Health: " + str(Global.Health_1))
	if(Global.Health_2 != -99):
		player_2_health_label.text = ("Player 2 Health: " + str(Global.Health_2))
	else:
		player_2_health_label.text = ""

func _on_points_changed():
	points_label.text = ("Points: " + str(Global.points))
	

func _on_player_1_health_change():
	player_1_health_label.text = ("Player 1 Health: " + str(Global.Health_1))


func _on_player_2_health_change():
	return
	if(Global.Health_2 != -99):
		player_2_health_label.text = ("Player 2 Health: " + str(Global.Health_2))
	else:
		player_2_health_label.text = ""
	
