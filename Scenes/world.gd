extends Node2D

signal ball_reset
signal ball_lost(num_lives: int)

var brick:PackedScene = preload("res://Scenes/brick.tscn")
var player_lives:int

@onready var container = $BrickContainer

# Called when the node enters the scene tree for the first time.
func _ready():
	GlobalSignalBus.connect('brick_hit', score_and_check)
	new_game()


# Called every frame. 'delta' is the elapsed time since the previous frame.
var need_check = false
func _process(_delta):
	if need_check:
		# check win
		var children = container.get_children()
		if len(children) == 0:
			print("You win!!")
			get_tree().quit()
		need_check = false



func _on_area_2d_area_entered(_area):
	# want to remove player life/respawn ball
	player_lives -= 1 # if we have multiple balls later, this may not always happen
	if player_lives == 0:
		print("You lost!!!") # Replace with function body.
		get_tree().quit()
	spawn_ball()

# these should be loaded from level config one day
var brick_pattern = '   1   1       1     \n1111111111111111111111111111111'
var height = 16
var width = 32
var offset_x = 100
var offset_y = 100

func new_game():
	player_lives = 3
	# also init score or anything else top-level here
	setup_level(0)
	
func setup_level(_level: int):
	load_bricks()
	spawn_ball()
	# will reset paddle and ball when we have it

func spawn_ball():
	ball_lost.emit(player_lives)
	ball_reset.emit()

func load_bricks():
	var rows = brick_pattern.split('\n')
	
	var i:int= 0
	var j:int = 0
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
