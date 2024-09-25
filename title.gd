extends Node2D

func _on_start_button_gui_input(event: InputEvent):
	if event is InputEventMouseButton:
		Map.Energy == 100
		print(Map.Energy)
		Map.materials == 2000
		get_tree().change_scene_to_file("res://Map.tscn")


func _on_exit_button_gui_input(event: InputEvent):
	if event is InputEventMouseButton:
		get_tree().quit()
