extends Node


signal updated
signal died

var Player1item: = 0 setget set_Player1item
var Player2item: = 0 setget set_Player2item
var Player1Heart: = 3 setget set_Player1Heart
var Player2Heart: = 3 setget set_Player1Heart
var deaths: = 0 setget set_deaths


func reset():
	self.item = 0
	self.deaths = 0


func set_Player1Heart(new_Player1Heart: int) -> void:
	Player1Heart = new_Player1Heart
	emit_signal("updated")

func set_Player2Heart(new_Player2Heart: int) -> void:
	Player2Heart = new_Player2Heart
	emit_signal("updated")	

func set_Player1item(new_Player1item: int) -> void:
	Player1item = new_Player1item
	emit_signal("updated")
	
func set_Player2item(new_Player2item: int) -> void:
	Player2item = new_Player2item
	emit_signal("updated")


func set_deaths(new_value: int) -> void:
	deaths = new_value
	emit_signal("died")
