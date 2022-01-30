extends KinematicBody2D


#var velocity = Vector2(1,0)
#var speed = 300
#
func _ready():
	var a = get_parent()

func _physics_process(delta):
	position.x += 10
	
