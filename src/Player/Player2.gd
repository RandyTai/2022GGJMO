extends KinematicBody2D

onready var bullet = preload("res://src/Player/bullet.tscn")
var b


#signal hit

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var speed = 400 # How fast the player will move (pixels/sec).
var screen_size # Size of the game window.
var face
var isAttacking = false
var flyx = 0
var flyy = 0
var hurt = false

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO
	var tex = position.x
	var tey = position.y
	
	if hurt == false :
		if Input.is_action_pressed("player2_move_right") and isAttacking == false:
			if tey == 64 || tey == screen_size.y -64:
				flyx = 0
				flyy = 0
				velocity.x += 1
		if Input.is_action_pressed("player2_move_left") and isAttacking == false:
			if tey == 64 || tey == screen_size.y -64:
				flyx = 0
				flyy = 0
				velocity.x -= 1
		if Input.is_action_pressed("player2_move_up") and isAttacking == false:
			if tex == 52 || tex == screen_size.x -52:
				flyx = 0
				flyy = 0
				velocity.y -= 1
		if Input.is_action_pressed("player2_move_down") and isAttacking == false:
			if tex == 52 || tex == screen_size.x -52:
				flyx = 0
				flyy = 0
				velocity.y += 1
		if Input.is_action_just_pressed("player2_jump") and isAttacking == false:
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
				$AttackArea/AttackCollision.position.x -= 110
			elif velocity.x > 0 && $AnimatedSprite.flip_h == true:
				$AttackArea/AttackCollision.position.x += 110
			$AnimatedSprite.flip_h = velocity.x < 0
		elif velocity.y != 0 and isAttacking == false:
			$AnimatedSprite.play('walk')
		elif isAttacking == false:
			$AnimatedSprite.play('stay')

		if Input.is_action_just_pressed("player2_attack"):
			if playerData.Player2item == 1:
				$AnimatedSprite.play("attack")
				$AttackArea/AttackCollision.disabled = false
				isAttacking = true
				playerData.Player2_Attack()

	position += velocity * speed *delta
	position.x += flyx * speed * delta *2
	position.y += flyy * speed * delta	*2
	position.x = clamp(position.x, 52, screen_size.x - 52)
	position.y = clamp(position.y, 64, screen_size.y - 64)
	
	
	if Input.is_action_just_pressed("player1_shoot"):
		b = bullet.instance()
		add_child(b)
		
	



func start(pos):
	position = pos
	show()
	#$Body.disabled = false


func _on_AnimatedSprite_animation_finished():
	if $AnimatedSprite.animation == 'hurt':
		$AnimatedSprite.play('stay')
		isAttacking = false
		hurt = false
	elif $AnimatedSprite.animation == 'attack':
		$AttackArea/AttackCollision.disabled = true
		isAttacking = false
		hurt = false

func _on_Body_area_entered(area):
	
	if area.is_in_group('P1_keyboard'):
		if $AttackArea/AttackCollision.disabled == false:
			$AttackArea/AttackCollision.disabled = true
		$AnimatedSprite.play("hurt")
		if hurt == false:
			playerData.set_Player2Heart(-1)
			var hp = playerData.Player2Heart
			if hp == 0:
				$HP/HP1.play('empty')
			elif hp == 1:
				$HP/HP1.play('full')
				$HP/HP2.play('empty')
			elif hp == 2:
				$HP/HP2.play('full')
				$HP/HP3.play('empty')
			elif hp == 3:
				$HP/HP3.play('full')
			hurt = true
		
#func shoot():
#	var bullet = bulletPath.instance()
#
#	get_parent().add_child(bullet)
#
#	bullet.position = $Position2D.global_position
