extends StaticBody2D


func get_hit():
	# will trigger point gains
	queue_free() # only once the brick is dead, otherwise change the image
