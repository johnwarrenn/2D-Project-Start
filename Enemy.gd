extends Node2D

@export var speed = 100

func _physics_process(delta):
	var target_position = get_viewport().get_visible_rect().size / 2
	var direction = global_position.direction_to(target_position)
	self.global_position += direction * speed * delta
	self.rotation = direction.angle() + PI / 2
	
func _on_area_entered(area):
	if area.is_in_group("asteroid"):
		self.queue_free()
	elif area.is_in_group("enemy"): 
		pass
	else:
		self.queue_free()
		Gamestate.increase_score(10)
