extends Node2D

var Keyboard = load("res://src/item/keyboard.tscn")
var Chair = load("res://src/item/Chair.tscn")
var Cola = load("res://src/item/Cola.tscn")
var Headphone = load("res://src/item/Headphone.tscn")
var Monitor = load("res://src/item/Monitor.tscn")
var Mouse = load("res://src/item/mouse.tscn")
#var bullet = preload("res://src/Player/bullet.tscn")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var list = [Keyboard,Chair,Cola,Headphone,Keyboard,Keyboard,Keyboard,Keyboard,Chair,Chair,Headphone] 
var size_y = OS.get_window_safe_area().size.y
var size_x = OS.get_window_safe_area().size.x
	
# Called when the node enters the scene tree for the first time.
func _ready():
	list.shuffle()
	print(list)
	randomize()
	$Timer.start()
	$Node/Player1.start(Vector2(size_x / 4, size_y))
	$Node/Player2.start(Vector2(size_x / 4 * 3, size_y))


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	$Player1.look_at($Player2.position)

func _on_Timer_timeout() -> void:
	var number = list[randi()%list.size()]
	if(get_child_count()<15):
		var buildX = randi() % (int(size_x - 150)) + 150
		var buildY = randi() % (int(size_y - 100)) + 100
		var b = number.instance()
		b.position = Vector2(buildX,buildY)
		add_child(b)

