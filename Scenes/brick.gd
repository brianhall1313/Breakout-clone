extends StaticBody2D


func get_hit():
	GlobalSignalBus.brick_hit.emit()
	queue_free() # only once the brick is dead, otherwise change the image

