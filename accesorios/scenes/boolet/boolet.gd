extends RigidBody2D

var speed = 500
var direction = Vector2(0, 0)
var raycast


##this is an area
onready var detect_hit = get_node("detect_hit")

func _ready():
	# Set the bullet's initial direction based on the direction variable.
	apply_central_impulse(direction.normalized() * speed)
	#raycast = get_node("RayCast2D")

func _process(delta):
	pass
	

func _on_detect_hit_body_entered(body):
	if body.is_in_group("enemy"):
		print("hit an enemy")
		queue_free()
	elif body.is_in_group("limit"):
		print("hit the limit!")
		queue_free()
