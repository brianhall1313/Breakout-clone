
extends StaticBody2D

@onready var current_texture = $BrickTexture
var hp:int = 1

func get_hit():
	GlobalSignalBus.brick_hit.emit()
	if self.hp > 1:
		set_hp(self.hp - 1)
	else:
		queue_free() # only once the brick is dead, otherwise change the image

func set_hp(new_hp:int):
	print('setting hp:', new_hp)
	self.hp = new_hp
	# set texture too
	print('current texture:', self.current_texture)
	self.current_texture.texture = BrickTexture.by_hp[self.hp]
