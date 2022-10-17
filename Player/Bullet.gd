extends Area


var speed : float = -30000.0
var damage : int = 1

func _process (delta):
	# move the bullet forwards
	translation += global_transform.basis.z * speed * delta

func _on_Bullet_body_entered(body):
	if body.has_method("take_damage"):
		body.take_damage(damage)
		destroy()

func destroy ():
	# destroys the bullet
	queue_free()

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
