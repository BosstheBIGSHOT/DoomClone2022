extends KinematicBody

onready var nav = get_parent()
var path = []
var path_note = 0
var speed = 10
onready var player = $"res://Player/Player.tscn"
