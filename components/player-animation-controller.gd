extends Node

var velocity: Vector2
var directions: Array
var last_directions: Array = ["right"]

## would be nice:
# enum animation_states {IDLE, WALK, RUN, CHANNEL}

func _physics_process(_delta: float) -> void:
	velocity = get_parent().get_node("MovementController").velocity

	if directions.size() > 0:
		last_directions = directions

	directions.clear()

	if velocity.x == 0 and velocity.y == 0:
		if not "idle" in directions:
			directions.append("idle")

	if velocity.x > 0:
		if not "right" in directions:
			directions.append("right")
	elif velocity.x < 0:
		if not "left" in directions:
			directions.append("left")

	if velocity.y > 0:
		if not "down" in directions:
			directions.append("down")
	elif velocity.y < 0:
		if not "up" in directions:
			directions.append("up")

	if "idle" in directions:
		if "right" in last_directions:
			get_parent().get_node("PlayerSprite").animation = "idle_right"
		elif "left" in last_directions:
			get_parent().get_node("PlayerSprite").animation = "idle_left"
	elif "right" in directions:
		get_parent().get_node("PlayerSprite").animation = "walk_right"
	elif "left" in directions:
		get_parent().get_node("PlayerSprite").animation = "walk_left"