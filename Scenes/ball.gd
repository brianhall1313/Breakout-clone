extends CharacterBody2D


func _physics_process(delta):
	if (velocity == Vector2.ZERO):
		velocity.y = 150
		velocity.x = 15
	var result = move_and_collide(velocity * delta)
	if result:
		velocity = velocity.bounce(result.get_normal()) 
		var obj = result.get_collider()
		if (obj.has_method('get_hit')):
			obj.get_hit()
