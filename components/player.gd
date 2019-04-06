extends KinematicBody2D

signal moved


func _on_MovementController_moved(velocity: Vector2) -> void:
	var effective_velocity = move_and_slide(velocity)
	$Sprite.update(velocity)
	emit_signal("moved", get_position(), velocity, effective_velocity)
