extends KinematicBody2D

signal moved


func _on_MovementController_moved(velocity):
	var _velocity = move_and_slide(velocity)
	emit_signal("moved", get_position())
