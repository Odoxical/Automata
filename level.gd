extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float):
	if Map.Energy <= 0:
		get_tree().change_scene_to_file("res://Title.tscn")
		Map.Energy = 100
		
