extends Node

signal updated
signal died

var Player1item: = 0 setget set_Player1item
var Player2item: = 0 setget set_Player2item
var Player1Heart = 0 
var Player2Heart = 0 
var Player1_skill = [0,0,0,0] setget set_Player1_skill
var Player2_skill = [0,0,0,0] setget set_Player2_skill

func reset():
	self.Player1Heart = 3
	self.Player2Heart = 3
	self.Player1item = 0
	self.Player2item = 0
	self.Player1_skill.clear()
	self.Player2_skill.clear()
	for _x in range(0,3):
		Player1_skill.append(false)
		Player2_skill.append(false)

func Player1_Attack() -> void:
	Player1item = 0

func Player2_Attack() -> void:
	Player2item = 0
	
func Player1_UseSkill() -> void:
	Player1_skill = [0,0,0,0]

func Player2_UseSkill() -> void:
	Player2_skill = [0,0,0,0]

func set_Player1Heart(new_Player1Heart: int) -> void:
	Player1Heart += new_Player1Heart
	if Player1Heart == 0:
		set_deaths()

func set_Player2Heart(new_Player2Heart: int) -> void:
	Player2Heart += new_Player2Heart
	if Player2Heart == 0:
		set_deaths()

func set_Player1item(new_Player1item: int) -> void:
	Player1item = new_Player1item
	emit_signal("updated")
	
func set_Player2item(new_Player2item: int) -> void:
	Player2item = new_Player2item
	emit_signal("updated")

func set_deaths() -> void:
	emit_signal("died")

func set_Player1_skill(new_value: int) -> void:
	if new_value == 1:
		Player1_skill[0] = true
	elif new_value == 2:
		Player1_skill[1] =true
	elif new_value == 2:
		Player1_skill[2] =true
	else:
		Player1_skill[3] =true

func set_Player2_skill(new_value: int) -> void:
	if new_value == 1:
		Player2_skill[0] = true
	elif new_value == 2:
		Player2_skill[1] =true
	elif new_value == 2:
		Player2_skill[2] =true
	else:
		Player2_skill[3] =true
