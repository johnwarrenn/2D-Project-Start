extends Area2D

var asteroid_health = 3.0
@onready var progress_bar = $ProgressBar

func _ready():
	progress_bar.value = asteroid_health
	
	
func _on_area_entered(area):
	if area.is_in_group("enemy"):
		asteroid_health -= 1.0
		progress_bar.value = asteroid_health
		
		if asteroid_health <= 0:
			queue_free()
			Gamestate.is_game_over = true
