extends Node

export (int) var speed = 200
signal moved


var velocity = Vector2()


func get_input():
	velocity = Vector2()
	
	if Input.is_action_pressed('move_right'):
		velocity.x += 1
	if Input.is_action_pressed('move_left'):
		velocity.x -= 1
	if Input.is_action_pressed('move_down'):
		velocity.y += 1
	if Input.is_action_pressed('move_up'):
		velocity.y -= 1
	
	velocity = velocity.normalized() * speed


func _physics_process(_delta):
	get_input()
	
	if velocity.x != 0 or velocity.y != 0:
		emit_signal("moved", velocity)
