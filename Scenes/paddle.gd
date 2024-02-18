extends CharacterBody2D


const SPEED = 400.0




func _physics_process(delta):
	if Input.is_action_pressed("left"):
		velocity.x -= 0.1
	elif Input.is_action_pressed("right"):
		velocity.x += 0.1
	else:
		if velocity.x > 0:
			velocity.x -= 0.25
		elif velocity.x < 0:
			velocity.x += 0.25
		if abs(velocity.x) < 0.25:
			velocity = Vector2.ZERO
	var result = move_and_collide(velocity * delta * SPEED)
	if result:
		velocity = Vector2.ZERO
