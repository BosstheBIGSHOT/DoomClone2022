extends Sprite

# SPIIIIIIN
func _process(delta):
	var degrees_per_second = 359999640.0
	rotate(delta * deg2rad(degrees_per_second))

func _ready():
	pass # Replace with function body.
