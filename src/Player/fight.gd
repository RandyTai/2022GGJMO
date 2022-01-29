extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var size_y = OS.get_window_safe_area().size.y
	var size_x = OS.get_window_safe_area().size.x


	$Player1.start(Vector2(size_x / 4, size_y))
	$Player2.start(Vector2(size_x / 4 * 3, size_y))


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
