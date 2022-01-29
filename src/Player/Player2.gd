extends Area2D

signal hit

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var speed = 400 # How fast the player will move (pixels/sec).
var screen_size # Size of the game window.
var face

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO
	var tex = position.x
	var tey = position.y
	
	if Input.is_action_pressed("player2_move_right"):
		#if tey == 112/2 || tey == screen_size.y - 112/2:
		velocity.x += 1
	if Input.is_action_pressed("player2_move_left"):
		#if tey == 112/2 || tey == screen_size.y - 112/2:
		velocity.x -= 1	
	#if Input.is_action_pressed("player1_move_up"):
		#if tex == 96/2 || tex == screen_size.x - 96/2:	
	#	velocity.y -= 1	
	#if Input.is_action_pressed("player1_move_down"):
		#if tex == 96/2 || tex == screen_size.x - 96/2:	
	#	velocity.y += 1
		
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
	
	position += velocity * delta
	position.x = clamp(position.x, 52, screen_size.x - 52)
	position.y = clamp(position.y, 64, screen_size.y - 64)
	
	if velocity.x != 0:
		$AnimatedSprite.animation = 'walk'
		$AnimatedSprite.flip_h = velocity.x < 0
	elif velocity.y != 0:
		$AnimatedSprite.animation = "walk"
		#$AnimatedSprite.flip_h = velocity.x < 0
		#if tey == 112/2:
		#	$AnimatedSprite.rotation_degrees = 180
		#elif tex == 96/2:
		#	$AnimatedSprite.rotation_degrees = 90
		#elif tex == screen_size.x - 96/2:
		#	$AnimatedSprite.rotation_degrees = 270
		#else:
		#	$AnimatedSprite.rotation_degrees = 0
	else:
		$AnimatedSprite.animation = 'stay'

func _on_Player_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	hide()
	emit_signal("hit")
	$CollisionObject2D.set_deferred("disable", true)

func start(pos):
	position = pos
	show()
	$Body.disabled = false
