extends KinematicBody

export(int) var speed = 1.7
var velocity = Vector3(0,0,0)
onready var anim = $AnimationPlayer
onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")

var playerposx = Game.PlayerPosition_X
var playerposy = Game.PlayerPosition_Y
var playerposz = Game.PlayerPosition_Z

var player_position = Vector3(playerposx, playerposy, playerposz)

func _ready():
	self.global_transform.origin = player_position

func Movement():
	playerposx = self.global_transform.origin.x
	playerposy = self.global_transform.origin.y
	playerposz = self.global_transform.origin.z
	
	Game.PlayerPosition_X = playerposx
	Game.PlayerPosition_Y = playerposy
	Game.PlayerPosition_Z = playerposz
	Autoload.save_game()
	
	if Input.is_action_pressed("ui_up"):
		velocity.z = -speed
		anim.play("backwardwalk")
	elif Input.is_action_pressed("ui_down"):
		velocity.z = speed
		anim.play("forwardwalk")
	else:
		velocity.z = lerp(velocity.z, 0, 0.5)
	if Input.is_action_pressed("ui_left"):
		velocity.x = -speed
		anim.play("leftwalk")
	elif Input.is_action_pressed("ui_right"):
		velocity.x = speed
		anim.play("rightwalk")
	elif Input.is_action_just_released("ui_left"):
		anim.play("idleleft")
	elif Input.is_action_just_released("ui_right"):
		anim.play("idleright")
	elif Input.is_action_just_released("ui_up"):
		anim.play("idle_up")
	elif Input.is_action_just_released("ui_down"):
		anim.play("idleforward")
	else:
		velocity.x = lerp(velocity.x, 0, 0.5)

func _physics_process(delta):
	Movement()
	move_and_slide(velocity)
