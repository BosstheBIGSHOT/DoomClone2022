extends KinematicBody

onready var nav = get_parent()
var path = []
var path_node = 0
var speed = 10
onready var player = $"../../Player"
var health = 100000

func _ready():
	pass

func _physics_process(delta):
	if path_node < path.size():
		var direction = (path[path_node] - global_transform.origin)
		if direction.length() < 1:
			path_node +=1
		else:
			move_and_slide(direction.normalized() * speed, Vector3.UP)
			
func move_to(target_pos):
	path = nav.get_simple_path(global_transform.origin, target_pos)
	path_node = 0


func _on_Timer_timeout():
	move_to(player.global_transform.origin)


func _on_Area_body_entered(body):
	if (body.name == "Player"):
		if Global.easyMode:
			Global.player_health -= 1
		if Global.mediumMode:
			Global.player_health -= 5
		if Global.hardMode:
			Global.player_health -= 10
		if Global.expertMode:
			Global.player_health -= 50
		if Global.eternityMode:
			Global.player_health -= 100

func take_damage(damage):
	health -= 50
	if health <=0:
		queue_free()
