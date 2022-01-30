extends Control


onready var scene_tree: SceneTree = get_tree()
onready var pause_overlay: ColorRect = $PauseOverlay
onready var title_label: Label = $PauseOverlay/Title
onready var main_screen_button: Button = $PauseOverlay/PauseMenu/MainScreenButton

const MESSAGE_DIED: = "You died"

var paused: = false setget set_paused

func _ready() -> void:
	playerData.connect("died", self, "_on_Player_died")


func _on_Player_died() -> void:
	self.paused = true


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		self.paused = not self.paused


func set_paused(value: bool) -> void:
	paused = value
	scene_tree.paused = value
	pause_overlay.visible = value
