extends Node2D
var materials = 2000
var Energy = 100 

func _ready():
	if Energy <= 0:
		print("you are dead")
		get_tree().change_scene_to_file("res://Title.tscn")
