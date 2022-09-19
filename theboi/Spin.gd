extends Sprite

func _process(delta):
	var degrees_per_second = 359999640.0
	rotate(delta * deg2rad(degrees_per_second))


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
