extends Panel

@onready var tower = preload("res://basic_tower.tscn")
var currtile

func _on_gui_input(event: InputEvent):
	var temptower = tower.instantiate
	print(event)
