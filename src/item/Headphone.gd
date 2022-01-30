extends Area2D

onready var anime_player: AnimationPlayer = get_node("AnimationPlayer")

export var item: = 2


func _on_Headphone_body_entered(body: PhysicsBody2D) -> void:
	if body.name == "Player1":
		Player1picked()
		queue_free()
	else:
		Player2picked()
		queue_free()

func Player1picked() -> void:
	playerData.Player1item = item
	anime_player.play("fade_out")

func Player2picked() -> void:
	playerData.Player2item = item
	anime_player.play("fade_out")
