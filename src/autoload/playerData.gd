extends Node


signal updated
signal died

var item: = 0 setget set_item
var deaths: = 0 setget set_deaths


func reset():
	self.item = 0
	self.deaths = 0


func set_item(new_item: int) -> void:
	item = new_item
	emit_signal("updated")


func set_deaths(new_value: int) -> void:
	deaths = new_value
	emit_signal("died")
