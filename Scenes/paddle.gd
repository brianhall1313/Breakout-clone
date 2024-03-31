extends CharacterBody2D

const SPEED:float = 400.0

func _physics_process(delta):
	if Input.is_action_pressed("left"):
		velocity.x -= 0.1
	elif Input.is_action_pressed("right"):
		velocity.x += 0.1
	else:
		if velocity.x > 0:
			velocity.x -= 0.35
		elif velocity.x < 0:
			velocity.x += 0.35
		if abs(velocity.x) < 0.35:
			velocity = Vector2.ZERO
	if abs(velocity.x) > 1:
		velocity.x = velocity.x / abs(velocity.x)
	var result = move_and_collide(velocity * delta * SPEED)
	if result:
		velocity = Vector2.ZERO
