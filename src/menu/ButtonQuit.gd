extends Button


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass


func _on_ButtonQuit_button_up() -> void:
	get_tree().quit()
	
