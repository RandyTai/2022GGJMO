extends Area2D

onready var anime_player: AnimationPlayer = get_node("AnimationPlayer")

export var item: = 6

func picked() -> void:
	PlayerData.item = 6


func _on_Chair_body_entered(body: Node) -> void:
	anime_player.play("fade_out")
	picked()
	remove_child(body)
