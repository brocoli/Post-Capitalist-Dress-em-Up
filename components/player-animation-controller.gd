extends Node


var idle = true
var right = true
var down = true


func update(velocity: Vector2) -> void:
	idle = velocity == Vector2.ZERO
	
	if velocity.x != 0:
		right = velocity.x > 0
	
	if velocity.y != 0:
		down = velocity.y > 0

	if idle:
		self.animation = "idle_right" if right else "idle_left"
	else:
		self.animation = "walk_right" if right else "walk_left"
