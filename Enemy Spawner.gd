extends Node2D

@onready var path = preload("res://Level1.tscn")

func _on_benemy_timeout() -> void:
	var tempPath = path.instantiate()
	add_child(tempPath)
