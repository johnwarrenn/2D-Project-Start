extends Node2D
@export var bullet_speed = 600
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	position.y -= bullet_speed * delta
	


func _on_area_entered(other_area):
	
	if other_area.is_in_group("enemy"):
		self.queue_free()
