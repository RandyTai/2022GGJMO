extends KinematicBody2D


#var velocity = Vector2(1,0)
#var speed = 300
#
func _ready():
	var _a = get_parent()

func _physics_process(_delta):
	position.x += 10
	
