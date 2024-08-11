extends CharacterBody2D

var target
var speed = 1000
var path_name = ""
var bullet_damage
@onready var EnemySpawnerNode = get_tree().get_first_node_in_group("EnemySpawner")
func _physics_process(delta):
	#var EnemySpawnerNode = get_tree().get_root().get_node("Path/PathFollow2D/Enemy Spawner")
	for i in EnemySpawnerNode.get_child_count():
		if EnemySpawnerNode.get_child(i).name == path_name:
			target = EnemySpawnerNode.get_child(i).get_child(0).get_child(0).global_position

	velocity = global_position.direction_to(target) *speed

	look_at(target)

	move_and_slide()

	

func _on_area_2d_body_entered(body):
	queue_free()
