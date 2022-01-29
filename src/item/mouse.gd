extends Area2D

onready var anime_player: AnimationPlayer = get_node("AnimationPlayer")

export var item: = 2


func picked() -> void:
	PlayerData.item = 2


func _on_mouse_body_entered(body: Node) -> void:
	anime_player.play("fade_out")
	picked()
	remove_child(body)
