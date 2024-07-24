extends PathFollow2D

var speed = 150

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	move(delta)

func move(delta):
	progress_ratio += speed * delta / get_parent().curve.get_baked_length()
