extends Area2D


onready var anime_player: AnimationPlayer = $AnimationPlayer

export var item: = 1

func _on_item_body_entered(body: PhysicsBody2D) -> void:
	picked()

func picked() -> void:
	#playerData.item = 1
	anime_player.play("fade_out")
