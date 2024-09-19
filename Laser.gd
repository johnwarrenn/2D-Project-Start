extends Node2D

@export var laser_speed = 600

var direction: Vector2

func _ready():
	
	direction = global_position.direction_to(get_global_mouse_position())

func _process(delta):
	global_position += direction * laser_speed * delta
	
	if not get_viewport_rect().has_point(global_position):
		queue_free()

func _on_area_entered(other_area):
	if other_area.is_in_group("enemy"):
		self.queue_free()
