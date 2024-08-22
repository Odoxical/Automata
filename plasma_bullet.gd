extends Area2D

var target
var speed = 1000
var path_name = ""
var bullet_damage
#@onready var EnemySpawnerNode = get_tree().get_first_node_in_group("EnemySpawner")
#get_first_node_in_group("EnemySpawner")
func _physics_process(delta):
	##var EnemySpawnerNode = get_tree().get_root().get_node("Path/PathFollow2D/Enemy Spawner")
	#for i in EnemySpawnerNode.get_child_count():
		#if EnemySpawnerNode.get_child(i).name == path_name:
			#target = EnemySpawnerNode.get_child(i).get_child(0).get_child(0).global_position
	
	translate(transform.x * speed * delta)
	


	

func _on_area_2d_body_entered(body):
	if body.is_in_group("Enemy"):
		body.health -= bullet_damage
		queue_free()
		
