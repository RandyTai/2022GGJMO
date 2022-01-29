extends Node2D

const bulletPath = preload("res://bullet.tscn")

var speed = 400
var flyx = 0
var flyy = 0
var flyx2 = 0
var flyy2= 0

onready var player1 = $Player
onready var player2 = $Player2
onready var runsound =$run


# Called when the node enters the scene tree for the first time.
func _ready():
	player1.position.x = 100
	player1.position.y = 570
	player2.position.x = 300
	player2.position.y = 570
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	
	
	var velocity = Vector2(0,0)
	var tex1 = player1.position.x
	var tey1 = player1.position.y
	
	var tex2 = player2.position.x
	var tey2 = player2.position.y
	
	if Input.is_action_pressed("P1_move_left"):
		runsound.play()
		if tey1 == 30 || tey1 == 570:
			flyx = 0
			flyy = 0
			player1.position.x -= speed * delta
		
	if Input.is_action_pressed("P1_move_right"):
		if tey1 == 30 || tey1 == 570:
			flyx = 0
			flyy = 0
			player1.position.x += speed * delta
			
	if Input.is_action_pressed("P1_move_up"):
		if tex1 == 30 || tex1 == 990:
			flyx = 0
			flyy = 0
			player1.position.y -= speed * delta
		
	if Input.is_action_pressed("P1_move_down"):
		if tex1 == 30 || tex1 == 990:
			flyx = 0
			flyy = 0
			player1.position.y += speed * delta	
			
	if Input.is_action_pressed("P1_jump"):
		if tex1 == 30 || tex1 == 990:
			if tex1 == 30:	
				flyx = 1
			if tex1 == 990:
				flyx = -1
				
			
		if tey1 == 30 || tey1 == 570:
			if tey1 == 30:
				flyy = 1
			if tey1 == 570:
				flyy = - 1
				
	#if tex1 == 30 || tex1 == 990 || tey1 == 30 || tey1 == 570:
	#	flyx = 0
	#	flyy = 0
	player1.position.x += flyx * speed *delta *2
	player1.position.y += flyy * speed *delta	*2	
	
	player1.position.x = clamp(player1.position.x,30,990)
	player1.position.y = clamp(player1.position.y,30,570)
	
	if Input.is_action_pressed("P2_move_left"):
		#runsound.play()
		if tey2 == 30 || tey2 == 570:
			flyx2 = 0
			flyy2 = 0
			player2.position.x -= speed * delta
		
	if Input.is_action_pressed("P2_move_right"):
		if tey2 == 30 || tey2 == 570:
			flyx2 = 0
			flyy2 = 0
			player2.position.x += speed * delta
			
	if Input.is_action_pressed("P2_move_up"):
		if tex2 == 30 || tex2 == 990:
			flyx2 = 0
			flyy2 = 0
			player2.position.y -= speed * delta
		
	if Input.is_action_pressed("P1_move_down"):
		if tex2 == 30 || tex2 == 990:
			flyx2 = 0
			flyy2 = 0
			player2.position.y += speed * delta	
			
	if Input.is_action_pressed("P2_jump"):
		if tex2 == 30 || tex2 == 990:
			if tex2 == 30:	
				flyx2 = 1
			if tex2 == 990:
				flyx2 = -1
				
			
		if tey2 == 30 || tey2 == 570:
			if tey2 == 30:
				flyy2 = 1
			if tey2 == 570:
				flyy2 = - 1
				
	#if tex1 == 30 || tex1 == 990 || tey1 == 30 || tey1 == 570:
	#	flyx = 0
	#	flyy = 0
	player2.position.x += flyx2 * speed *delta *2
	player2.position.y += flyy2 * speed *delta	*2	
			
	player2.position.x = clamp(player2.position.x,30,990)
	player2.position.y = clamp(player2.position.y,30,570)
		

	velocity = velocity.normalized()
	#player1.move_and_collide(velocity)
	
func shoot():
	var bullet = bulletPath.instance()
