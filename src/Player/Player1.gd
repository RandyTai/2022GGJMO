extends KinematicBody2D

signal hit

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var speed = 400 # How fast the player will move (pixels/sec).
var screen_size # Size of the game window.
var face
var isAttacking = false
var flyx = 0
var flyy = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO
	var tex = position.x
	var tey = position.y
	
	if Input.is_action_pressed("player1_move_right") and isAttacking == false:
		if tey == 64 || tey == screen_size.y -64:
			flyx = 0
			flyy = 0
			velocity.x += 1
	if Input.is_action_pressed("player1_move_left") and isAttacking == false:
		if tey == 64 || tey == screen_size.y -64:
			flyx = 0
			flyy = 0
			velocity.x -= 1
	if Input.is_action_pressed("player1_move_up") and isAttacking == false:
		if tex == 52 || tex == screen_size.x -52:
			flyx = 0
			flyy = 0
			velocity.y -= 1
	if Input.is_action_pressed("player1_move_down") and isAttacking == false:
		if tex == 52 || tex == screen_size.x -52:
			flyx = 0
			flyy = 0
			velocity.y += 1
	if Input.is_action_just_pressed("player1_jump") and isAttacking == false:
		if tex == 52:
			flyx = 1
		if tex == screen_size.x - 52:
			flyx = -1
		if tey == 64:
			flyy = 1
		if tey == screen_size.y - 64:
			flyy = -1

	if velocity.x != 0 and isAttacking == false:
		$AnimatedSprite.play('walk')
		if velocity.x < 0 && $AnimatedSprite.flip_h == false:
			$AttackArea/AttackCollision.position.x -= 125
		elif velocity.x > 0 && $AnimatedSprite.flip_h == true:
			$AttackArea/AttackCollision.position.x += 125
		$AnimatedSprite.flip_h = velocity.x < 0
	elif velocity.y != 0 and isAttacking == false:
		$AnimatedSprite.play('walk')
	elif isAttacking == false:
		$AnimatedSprite.play('stay')

	if Input.is_action_just_pressed("player1_attack"):
		$AnimatedSprite.play("attack")
		$AttackArea/AttackCollision.disabled = false
		isAttacking = true

	position += velocity * speed *delta
	position.x += flyx * speed * delta *2
	position.y += flyy * speed * delta	*2
	position.x = clamp(position.x, 52, screen_size.x - 52)
	position.y = clamp(position.y, 64, screen_size.y - 64)

func _on_Player_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	hide()
	emit_signal("hit")
	$CollisionObject2D.set_deferred("disable", true)

func start(pos):
	position = pos
	show()
	#$Body.disabled = false


func _on_AnimatedSprite_animation_finished():
	if $AnimatedSprite.animation == 'attack':
		$AttackArea/AttackCollision.disabled = true
		isAttacking = false
