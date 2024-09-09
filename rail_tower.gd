extends Node2D

var BULLET = preload("res://railgun_bullet.tscn")
var bullet_damage = 400
var path_name
var current_targets = [] #targets in range
var current #curently attacking
@onready var shoot_timer: Timer = $ShootTimer

func _on_tower_body_exited(body):
		if current == body:
			current = null

func _on_tower_body_entered(body):
	if body.is_in_group("Enemy"):
		current_targets.append(body)
		if not current:
			current = current_targets.pop_back()
	
	if current and shoot_timer.is_stopped():
		shoot_timer.start()

func update_target():
	if not current:
		current = current_targets.pop_back()
		
		

func _on_shoot_timer_timeout() -> void:
	var bullet = BULLET.instantiate()
	update_target()
	if current == null:
		return
		shoot_timer.stop()
	add_sibling(bullet)
	bullet.global_position = global_position
	bullet.look_at(current.global_position)
	if current:
		shoot_timer.start()
