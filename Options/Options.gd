extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer/HBoxContainer/VBoxContainer/Easy.pressed = Global.easyMode
	$VBoxContainer/HBoxContainer/VBoxContainer/Medium.pressed = Global.mediumMode
	$VBoxContainer/HBoxContainer/VBoxContainer/Hard.pressed = Global.hardMode
	$VBoxContainer/HBoxContainer/VBoxContainer/Expert.pressed = Global.expertMode
	$VBoxContainer/HBoxContainer/VBoxContainer/Eternity.pressed = Global.eternityMode
	print("here")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


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
