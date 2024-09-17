extends Area2D

@export var laser_tscn: PackedScene
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var mouse_pos = get_parent().to_local(get_global_mouse_position())
	position.x = mouse_pos.x
	
	if Input.is_action_just_pressed("Shoot"):
		var new_laser = laser_tscn.instantiate()
		add_sibling(new_laser)
		new_laser.position = self.position


func _on_area_entered(area):
	if area.is_in_group("enemy"):
		self.queue_free()
		
		Gamestate.is_game_over = true
