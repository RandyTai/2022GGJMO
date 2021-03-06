extends Area2D

onready var anime_player: AnimationPlayer = get_node("AnimationPlayer")

export var item: = 6


func _on_mouse_body_entered(body: PhysicsBody2D) -> void:
	if body.name == "Player1":
		queue_free()
		Player1picked()
	else:
		queue_free()
		Player2picked()

func Player1picked() -> void:
	playerData.Player1item = item
	anime_player.play("fade_out")

func Player2picked() -> void:
	playerData.Player2item = item
	anime_player.play("fade_out")
