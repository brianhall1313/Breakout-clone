extends Node2D

var brick = preload("res://Scenes/brick.tscn")
@onready var container = $BrickContainer

# Called when the node enters the scene tree for the first time.
func _ready():
	GlobalSignalBus.connect('brick_hit', score_and_check)
	load_bricks()


# Called every frame. 'delta' is the elapsed time since the previous frame.
var need_check = false
func _process(delta):
	if need_check:
		# check win
		var children = container.get_children()
		if len(children) == 0:
			print("You win!!")
			get_tree().quit()
		need_check = false



func _on_area_2d_area_entered(area):
	# want to remove player life/respawn ball
	print("You lost!!!") # Replace with function body.
	get_tree().quit()

# these should be loaded from level config one day
var brick_pattern = '   1   1       1     \n1111111111111111111111111111111'
var height = 16
var width = 32
var offset_x = 100
var offset_y = 100

func load_bricks():
	var rows = brick_pattern.split('\n')
	
	var i = 0
	var j = 0
	for row in rows:
		j = 0
		for tile in row.split(''):
			if tile == '1':
				var newBrick = brick.instantiate()
				container.add_child(newBrick)
				newBrick.position = Vector2(j * width + offset_x, i * height + offset_y)
			j = j + 1
		i = i + 1

func score_and_check():
	print("You hit something!")
	# add score if we track it
	need_check = true
