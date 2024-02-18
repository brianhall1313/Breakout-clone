extends Node2D

var brick = preload("res://Scenes/brick.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	var newBrick = brick.instantiate()
	add_child(newBrick)
	newBrick.position = Vector2(300, 300)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_area_2d_area_entered(area):
	# want to remove player life/respawn ball
	pass # Replace with function body.
