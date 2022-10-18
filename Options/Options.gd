extends Control

# allows them to press and update
func _ready():
	$VBoxContainer/HBoxContainer/VBoxContainer/Easy.pressed = Global.easyMode
	$VBoxContainer/HBoxContainer/VBoxContainer/Medium.pressed = Global.mediumMode
	$VBoxContainer/HBoxContainer/VBoxContainer/Hard.pressed = Global.hardMode
	$VBoxContainer/HBoxContainer/VBoxContainer/Expert.pressed = Global.expertMode
	$VBoxContainer/HBoxContainer/VBoxContainer/Eternity.pressed = Global.eternityMode
	# acknowledges the button is pressed and that the code has worked
	print("here")

# makes it update the Global difficulty modes
func _on_Easy_toggled(button_pressed):
	Global.easyMode = button_pressed
func _on_Medium_toggled(button_pressed):
	Global.mediumMode = button_pressed
func _on_Hard_toggled(button_pressed):
	Global.hardMode = button_pressed
func _on_Expert_toggled(button_pressed):
	Global.expertMode = button_pressed
func _on_Eternity_toggled(button_pressed):
	Global.eternityMode = button_pressed
