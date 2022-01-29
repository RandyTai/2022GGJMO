extends Area2D

onready var anime_player: AnimationPlayer = get_node("AnimationPlayer")

export var item: = 1

func _on_item_body_entered(body: PhysicsBody2D) -> void:
	anime_player.play("fade_out")
	picked()
	remove_child(body)

func picked() -> void:
	PlayerData.item = 1
