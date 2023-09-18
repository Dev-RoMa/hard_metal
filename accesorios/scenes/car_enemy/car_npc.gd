extends KinematicBody2D

var hp = 100
onready var hit_box = get_node("detect_hit")
onready var raycast_forward = $front_raycast
onready var raycast_left = $left_raycast
onready var raycast_right = $right_raycast
onready var raycast_back = $back_raycast
var speed = 100
var rotation_speed = 2.0

func _ready():
	pass

func _process(delta):
	var move_vector = Vector2(0, -speed)  # Move forward initially

	# Front raycast
	var collider = raycast_forward.get_collider()
	if raycast_forward.is_colliding():
		speed = -abs(speed)  # Set speed to a negative value when front raycast detects a collision
	#if raycast_forward.is_colliding() and collider.name == "car":
	#	speed = speed
	# Back raycast
	if raycast_back.is_colliding():
		speed = abs(speed)  # Set speed to a positive value when back raycast detects a collision

	# Left raycast
	if raycast_left.is_colliding():
		rotate(-rotation_speed * delta)  # Rotate to the left when collision is detected

	# Right raycast
	if raycast_right.is_colliding():
		rotate(rotation_speed * delta)  # Rotate to the right when collision is detected

	move_vector = move_vector.rotated(rotation)  # Apply rotation to movement vector

	move_and_slide(move_vector)

func _on_detect_hit_body_entered(body):
	if body.is_in_group("enemy"):
		hp -= 1
		print("Enemy hp =", hp)
