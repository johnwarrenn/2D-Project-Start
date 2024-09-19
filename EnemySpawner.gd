extends Node2D

@export var enemy_tscn: PackedScene

@onready var path_follow_2d = %PathFollow2D

func spawn_enemy_ship():
	var new_enemy = enemy_tscn.instantiate()
	self.add_child(new_enemy)
	path_follow_2d.progress_ratio = randf_range(0,1)
	new_enemy.global_position = path_follow_2d.global_position
	
