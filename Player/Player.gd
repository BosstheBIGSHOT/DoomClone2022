extends KinematicBody

# variables like movement and the such
# Physics
var movementSpeed = 20.0 		# How fast the player can move.
var jumpStrength = 5.0 		# How much force used to make player jump
var gravity = 10.0			# Gravity's strength.

# cam look
var minCamVerticalAngle = -90.0		# Limit camera view to straight down.
var maxCamVerticalAngle = 90.0		# Limit camera view to straight up.
var lookSensitivity = 0.5			# How fast camera moves. 'mouse sensitivity'. 

# vectors
var playerVelocity : Vector3 = Vector3() 	# Players Velocity
var mouseDelta : Vector2 = Vector2()			# How much the mouse has moved since last frame refresh.

# player components
onready var bulletScene = preload("res://Player/Bullet.tscn")
onready var bulletSpawn = get_node("Camera/bulletSpawn")
onready var camera = get_node("Camera")		# "attach" the camera to access from script.

# Called when the node enters the scene tree for the first time.
func _ready():
	# hide the mouse
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	$Camera/HPValue.text = str(Global.player_health)
	$Camera/AmmoAmount.text = str(Global.ammo)
	
# called when an input is detected
func _input (event):
	# did the mouse move?
	if event is InputEventMouseMotion:
		mouseDelta = event.relative
		
# called every frame
func _process (delta):
	$Camera/HPValue.text = str(Global.player_health)
	$Camera/AmmoAmount.text = str(Global.ammo)
	# rotate camera along X axis
	camera.rotation_degrees -= Vector3(rad2deg(mouseDelta.y), 0, 0) * lookSensitivity * delta
	# clamp the vertical camera rotation
	camera.rotation_degrees.x = clamp(camera.rotation_degrees.x, minCamVerticalAngle, maxCamVerticalAngle)
	# rotate player along Y axis
	rotation_degrees -= Vector3(0, rad2deg(mouseDelta.x), 0) * lookSensitivity * delta
	# reset the mouse delta vector
	mouseDelta = Vector2()
	# shoot
	if Global.easyMode:
		if Input.is_action_pressed("shoot"):
			shoot()
	if Global.mediumMode:
		if Input.is_action_just_pressed("shoot"):
			shoot()
	if Global.hardMode:
		if Input.is_action_just_pressed("shoot"):
			shoot()
	if Global.expertMode:
		if Input.is_action_just_pressed("shoot"):
			shoot()
	if Global.eternityMode:
		if Input.is_action_just_pressed("shoot"):
			shoot()
	# reload
	if Input.is_action_just_pressed("reload"):
		if Global.mediumMode:
			Global.ammo = 6
		if Global.hardMode:
			Global.ammo = 6
		if Global.expertMode:
			Global.ammo = 6
		if Global.eternityMode:
			Global.ammo = 6
	if Input.is_action_pressed("reload"):
		if Global.easyMode:
			Global.ammo += 6
	# die
	if Global.player_health <= 0:
		print("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA")
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		get_tree().change_scene("res://Gameover/Gameover.tscn")
	if Global.ammo >=100:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		get_tree().change_scene("res://Gameover/Gameover.tscn")
# called every physics step
func _physics_process (delta):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()
	# reset the x and z velocity
	playerVelocity.x = 0
	playerVelocity.z = 0
	var input = Vector2()
	# movement inputs
	if Input.is_action_pressed("player_forward"):
		input.y -= 1
	if Input.is_action_pressed("player_backward"):
		input.y += 1
	if Input.is_action_pressed("player_left"):
		input.x -= 1
	if Input.is_action_pressed("player_right"):
		input.x += 1
	# normalize the input so we can't move faster diagonally
	input = input.normalized()
	# get our forward and right directions
	var forward = global_transform.basis.z
	var right = global_transform.basis.x
	# set the velocity
	playerVelocity.z = (forward * input.y + right * input.x).z * movementSpeed
	playerVelocity.x = (forward * input.y + right * input.x).x * movementSpeed
	# apply gravity
	playerVelocity.y -= gravity * delta
	# move the player
	playerVelocity = move_and_slide(playerVelocity, Vector3.UP)
	# jump if we press the jump button and are standing on the floor
	if Input.is_action_pressed("jump") and is_on_floor():
		playerVelocity.y = jumpStrength
# shooting bullets
func shoot ():
	if Global.ammo >= 1:
		var bullet = bulletScene.instance()
		get_node("/root/BountyHunter").add_child(bullet)
		bullet.global_transform = bulletSpawn.global_transform
		bullet.scale = Vector3(0.1,0.1,0.1)
		Global.ammo -= 1
		

