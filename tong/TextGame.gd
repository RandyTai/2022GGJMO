extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const TEXT_mouse = 'test test'
const TEXT_mouseQ = '遊戲開始'
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_ButtonQuit_pressed():
	get_tree().quit()
	


func _on_ButtonStart_mouse_entered():
	$ButtonStart.text = TEXT_mouse


func _on_ButtonStart_mouse_exited():
	$ButtonStart.text = TEXT_mouseQ
