extends Panel

@onready var tower = preload("res://flamethrower_tower.tscn")
@onready var materials = preload("res://Map.tscn")
var currtile
var cost = 1200

func _on_gui_input(event: InputEvent):
	var temptower = tower.instantiate()
	if event is InputEventMouseButton and event.button_mask == 1:
		add_child(temptower)
		temptower.process_mode = Node.PROCESS_MODE_DISABLED
		#left Click Pressed
	elif event is InputEventMouseMotion and event.button_mask == 1:
		get_child(1).global_position = get_global_mouse_position()
		#Drag
		print(get_global_mouse_position())

	elif event is InputEventMouseButton and event.button_mask == 0:
		if Map.materials >= cost:
			Map.materials = Map.materials - cost
			var path = get_tree().get_first_node_in_group("TowerGroup")
			get_child(1).queue_free()
			#Left Click Released
		
			path.add_child(temptower)
			temptower.global_position = get_viewport().get_mouse_position()
		#temptower.get_node("Area").hide
