extends Node2D

var BULLET = preload("res://plasma_bullet.tscn")
var bullet_damage = 50
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
		
		
	#if "Easy_Enemy" in body.name:
		#var tempArray = []
		#current_targets = get_node("Tower").get_overlapping_bodies()
		#
		#for i in current_targets:
			#if "Enemy" in i.name:
				#tempArray.append(i)
		#
		#var current_targets = null
		#
		#for i in tempArray:
			#if current_targets == null:
				#current_targets = i.get_node("../")
			#else:
				#if i.get_parent().getprogress() > current_targets.get_progress():
					#current_targets = i.get_node("../")
		#
		#current = current_targets
		#path_name = current_targets.get_parent().name
		#
		#var temp_bullet = bullet.instantiate()
		#temp_bullet.path_name = path_name
		#temp_bullet.bullet_damage = bullet_damage
		#get_node("bulletcontainer").add_child(temp_bullet)
		#temp_bullet.global_position = $Aim.global_position
		#temp_bullet.target = body


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
