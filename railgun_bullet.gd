extends Area2D

var target
var speed = 5000
var path_name = ""
var bullet_damage = 400
var pierce = 20
var hit = -5

#@onready var EnemySpawnerNode = get_tree().get_first_node_in_group("EnemySpawner")
#get_first_node_in_group("EnemySpawner")
func _physics_process(delta):
	translate(transform.x * speed * delta)
	
func _on_area_2d_body_entered(body):
	if body.is_in_group("Enemy"):
		if hit <= 0:
			body.health -=bullet_damage
			print("is good")
			var hit =+ 1
			pierce - 1

func _on_area_2d_body_exited(body):
	if body.is_in_group("Enemy"):
		var hit =- 1

	if pierce <= 0:
		queue_free()
