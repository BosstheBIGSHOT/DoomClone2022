extends Button

export(String) var scene_to_load

# Change scenes and quit
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
func _on_Menu_pressed():
	get_tree().change_scene(scene_to_load)
func _on_Quit_pressed():
	get_tree().quit()
func _on_Start_pressed():
	get_tree().change_scene(scene_to_load)
