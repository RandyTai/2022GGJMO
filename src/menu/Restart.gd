extends Button


func _on_Restart_button_up() -> void:
	playerData.reset()
	get_tree().paused = false
	var _a = get_tree().reload_current_scene()
