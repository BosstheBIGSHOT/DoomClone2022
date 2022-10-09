extends Button

export(String) var scene_to_load
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Play_pressed():
	get_tree().change_scene(scene_to_load)


func _on_Options_pressed():
	get_tree().change_scene(scene_to_load)


func _on_Buttons_pressed():
	get_tree().change_scene(scene_to_load)


func _on_ToBeContinued_pressed():
	get_tree().quit()


func _on_The_Boi_pressed():
	get_tree().change_scene(scene_to_load)


func _on_Back_pressed():
	get_tree().change_scene(scene_to_load)
