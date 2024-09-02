extends Panel

@onready var tower = preload("res://basic_tower.tscn")
var currtile

func _on_gui_input(event: InputEvent):
	var temptower = tower.instantiate
	if event is InputEventMouseButton and event.button_mask == 1:
		add_child(temptower)
		temptower.global_position = event.global_position
		temptower.process_mode = Node.PROCESS_MODE_DISABLED
		#left Click Pressed
	elif event is InputEventMouseMotion and event.button_mask == 1:
		pass
		#Drag
	elif event is InputEventMouseButton and event.button_mask == 0:
		pass
		#Left Click Released
