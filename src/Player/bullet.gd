extends KinematicBody2D

export var face = 0

#var velocity = Vector2(1,0)
#var speed = 300
#
func _ready():
	var _a = get_parent()
	print(_a)
	face = 10

func _physics_process(_delta):
	position.x += face
	
