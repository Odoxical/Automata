extends Area2D

var target
var speed = 1000
var path_name = ""
var bullet_damage = 50

func _physics_process(delta):
	translate(transform.x * speed * delta)
	
func _on_area_2d_body_entered(body):
	if body.is_in_group("Enemy"):
		body.health -=bullet_damage 
		queue_free()
