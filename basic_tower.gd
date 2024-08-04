extends Node2D

var bullet = preload("res://plasma_bullet.tscn")
var bullet_damage = 5
var path_name
var current_targets = [] #targets in range
var current #curently attacking

func _on_tower_body_exited(body):
	pass # Replace with function body.

func _on_tower_body_entered(body):
	
	if "Easy_Enemy" in body.name:
		var tempArray = []
		current_targets = get_node("Tower").get_overlapping_bodies()
		
		for i in current_targets:
			if "Enemy" in i.name:
				tempArray.append(i)
		
		var current_targets = null
		
		for i in tempArray:
			if current_targets == null:
				current_targets = i.get_node("../")
			else:
				if i.get_parent().getprogress() > current_targets.get_progress():
					current_targets = i.get_node("../")
		
		current = current_targets
		path_name = current_targets.get_parent().name
		
		var temp_bullet = bullet.instantiate()
		temp_bullet.path_name = path_name
		temp_bullet.bullet_damage = bullet_damage
		get_node("bulletcontainer").add_child(temp_bullet)
		temp_bullet.global_position = $Aim.global_position
