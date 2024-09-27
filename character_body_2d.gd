extends CharacterBody2D

@export var speed = 225
@onready var Energy = preload("res://Map.tscn")
var health = 75
var Damage = 25
var Biomass = 150

func _process(delta):
	var progress = get_parent().get_progress() # Get the current progress
	get_parent().set_progress(progress + (speed * delta)) # Update the progress
	if (get_parent().get_progress_ratio())>=0.99:
		Map.Energy = Map.Energy - Damage #if this enemy reaches the end, it takes away some of your energy (player health)
		queue_free()

	if health <= 0:
		Map.materials = Map.materials+Biomass
		queue_free() #on death
