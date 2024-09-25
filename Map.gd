extends Node2D
var materials = 2000
var Energy = 100 

func _on_ready():
	var materials = 2000
	var Energy = 100 

func _process(delta: float):
	if Energy <= 0:
		get_tree().change_scene_to_file("res://Title.tscn")
