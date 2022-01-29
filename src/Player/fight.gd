extends Node2D

var keyboard = load("res://src/item/keyboard.tscn")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	$Timer.start()
	var size_y = OS.get_window_safe_area().size.y
	var size_x = OS.get_window_safe_area().size.x
	$Player1.start(Vector2(size_x / 4, size_y))
	$Player2.start(Vector2(size_x / 4 * 3, size_y))


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout() -> void:
	if(get_child_count()<10):
		var size = OS.get_window_safe_area().size
		var buildX = randi() % (int(size.x - 100))
		var buildY = randi() % (int(size.y - 100))
		var b = keyboard.instance()
		b.position = Vector2(buildX,buildY)
		add_child(b)

