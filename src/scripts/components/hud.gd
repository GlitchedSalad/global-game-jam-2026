extends CanvasLayer

@onready var points_label := $Points

func _ready() -> void:
	Global.connect("points_changed", _on_points_changed)
	points_label.text = ("Points: " + str(Global.points))

func _on_points_changed():
	points_label.text = ("Points: " + str(Global.points))
