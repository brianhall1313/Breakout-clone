extends Label



func _on_world_score_updated(new_score):
	self.text = "Score: " + str(new_score)
