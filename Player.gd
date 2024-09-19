extends Area2D

@export var laser_tscn: PackedScene
@export var max_speed: float = 800 
@export var min_speed: float = 0

func _process(delta):
	var mouse_pos = get_global_mouse_position()
	var target_position = mouse_pos
	var direction = global_position.direction_to(target_position)
	
	var distance_to_mouse = global_position.distance_to(mouse_pos)
	#found this while trying to find out how to adjust speed based on distance from the mouse. https://forum.godotengine.org/t/set-velocity-based-on-distance/21146
	var speed = lerp(min_speed, max_speed, distance_to_mouse / get_viewport().get_visible_rect().size.length()) 

	self.global_position += direction * speed * delta
	self.rotation = direction.angle() + PI / 2
	
	if Input.is_action_just_pressed("Shoot"):
		var new_laser = laser_tscn.instantiate()
		new_laser.global_position = self.get_parent().to_local(global_position)
		new_laser.global_rotation = self.global_rotation
		add_sibling(new_laser)
		


func _on_area_entered(area):
	if area.is_in_group("enemy"):
		self.queue_free()
		Gamestate.is_game_over = true
		

