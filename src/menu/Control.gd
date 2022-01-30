tool
extends Control

export(String,FILE) var next_scene_path: = ""
onready var scene_tree: SceneTree = get_tree()
onready var pause_overlay: ColorRect = $PauseOverlay

const MESSAGE_DIED: = "You died"

var paused: = false setget set_paused

func _ready() -> void:
	var _a = playerData.connect("died", self, "_on_Player_died")


func _on_Player_died() -> void:
	#self.paused = true
	var _a = get_tree().change_scene(next_scene_path)

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		self.paused = not self.paused
		print("died")


func set_paused(value: bool) -> void:
	paused = value
	scene_tree.paused = value
	pause_overlay.visible = value
	print(value)

