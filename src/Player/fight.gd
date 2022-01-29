extends Node2D

var Keyboard = load("res://src/item/keyboard.tscn")
var Chair = load("res://src/item/chair.tscn")
var Cola = load("res://src/item/Cola.tscn")
var Headphone = load("res://src/item/Headphone.tscn")
var Monitor = load("res://src/item/Monitor.tscn")
var Mouse = load("res://src/item/Mouse.tscn")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var list = [Keyboard,Chair,Cola,Headphone,Monitor,Mouse] 

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
	var number = list[randi()%list.size()]
	if(get_child_count()<10):
		var size = OS.get_window_safe_area().size
		var buildX = randi() % (int(size.x - 100)) + 50
		var buildY = randi() % (int(size.y - 100)) + 50
		var b = number.instance()
		b.position = Vector2(buildX,buildY)
		add_child(b)

