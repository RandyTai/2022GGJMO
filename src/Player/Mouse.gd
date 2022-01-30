extends Sprite


var can_fire = true


# Called when the node enters the scene tree for the first time.
func _ready():
	set_as_toplevel(true)


func _physics_process(delta):
	position.x = lerp(position.x, get_parent().position.x+20, 0.5)
	position.y = lerp(position.y, get_parent().position.y+20, 0.5)
	var mouse_pos = get_global_mouse_position()
	look_at(mouse_pos)
