extends CharacterBody2D


func _physics_process(delta):
	if (velocity == Vector2.ZERO):
		velocity.y = 50
		velocity.x = 15
	var result = move_and_collide(velocity * delta)
	if result:
		var obj = result.get_collider()
		#velocity.bounce(result.get_normal()) 
		velocity = result.get_normal() * velocity
	
