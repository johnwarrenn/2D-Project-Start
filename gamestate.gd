extends Node

var score = 0
var is_game_over = false
var asteroid_health = 3

func reset_values():
	score = 0
	is_game_over = false
	

func increase_score(increase_amount):
	score += increase_amount
	
