extends CharacterBody2D

@export var speed = 150
var health = 100

func _process(delta):
	var progress = get_parent().get_progress() # Get the current progress
	get_parent().set_progress(progress + (speed * delta)) # Update the progress

	if get_parent().get_progress_ratio() == 1:
		queue_free()

	if health <= 0:
		queue_free()
