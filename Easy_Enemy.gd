extends CharacterBody2D

@export var speed = 150
@onready var Energy = preload("res://Map.tscn")
var health = 100
var Damage = 20
var Biomass = 100

func _process(delta):
	var progress = get_parent().get_progress() # Get the current progress
	get_parent().set_progress(progress + (speed * delta)) # Update the progress
	print("Before the if",Map.Energy)
	if (get_parent().get_progress_ratio())>=0.99:
		Map.Energy = Map.Energy - Damage
		queue_free()

	if health <= 0:
		Map.materials = Map.materials+Biomass
		queue_free()
#on death
