extends Label

func _process(delta):
	if Gamestate.is_game_over:
		self.visible = true
		
	if Input.is_action_just_pressed("ui_accept") and Gamestate.is_game_over:
		get_tree().reload_current_scene()
		Gamestate.reset_values()
		
