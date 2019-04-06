extends Node

export (int) var speed: int = 200

var velocity: Vector2 = Vector2()

func get_input() -> void:
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

func _physics_process(_delta: float) -> void:
	get_input()
	get_parent().move_and_slide(velocity)
