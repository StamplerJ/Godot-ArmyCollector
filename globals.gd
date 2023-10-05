extends Node2D

var VELOCITY_MULTIPLIER: int = 100

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit()
