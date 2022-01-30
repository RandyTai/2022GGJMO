extends Area2D


onready var anime_player: AnimationPlayer = $AnimationPlayer

export var item: = 1

func _on_item_body_entered(body: PhysicsBody2D) -> void:
	if body.name == "Player1":
		queue_free()
		Player1picked()
	else:
		Player2picked()
		queue_free()

func Player1picked() -> void:
	playerData.Player1item = 1
	anime_player.play("fade_out")

func Player2picked() -> void:
	playerData.Player2item = 1
	anime_player.play("fade_out")
