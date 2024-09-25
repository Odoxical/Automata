extends Node2D
var materials = 2000
var Energy = 100 

#func _on_ready():
#	var materials = 2000
#	var Energy = 100 

#func _process(delta: float):
#	if Energy <= 0:
#		get_tree().reload_current_scene() 
#		await get_tree().change_scene_to_file("res://Title.tscn")

func _process(delta: float):
	if Energy <= 0:  # Check if player health is depleted
		if not $"Death Timer".is_stopped():  # Check if the timer is already running
			$"Death Timer".start()  # Start the Death Timer

# Timer timeout function
func _on_death_timer_timeout() -> void:
	await get_tree().create_timer(0.1).timeout  # Add a small delay before reloading
	# Defer the scene reload to avoid null instance errors
	call_deferred("_reload_scene")

func _reload_scene():
	get_tree().reload_current_scene()
	await get_tree().create_timer(0.1).timeout  # Add delay before moving to the title
	get_tree().change_scene_to_file("res://Title.tscn")


	# Move to the Title screen after the scene has reloaded
	await get_tree().create_timer(0.1).timeout  # Another delay before transitioning
	get_tree().change_scene_to_file("res://Title.tscn")
