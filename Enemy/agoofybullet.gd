extends Area

# variables, speed, damage and the like
var speed : float = 2000.0
var damage : int = 1

func _process (delta):
	# move the bullet forwards
	translation += global_transform.basis.z * speed * delta

# destroy the bullets
func _on_agoofybullet_body_entered(body):
	destroy()
	if (body.name == "Player"):
		if Global.easyMode:
			Global.player_health -= 1
		if Global.mediumMode:
			Global.player_health -= 5
		if Global.hardMode:
			Global.player_health -= 10
		if Global.expertMode:
			Global.player_health -= 25
		if Global.eternityMode:
			Global.player_health -= 100

func destroy ():
	# destroys the bullet
	queue_free()
