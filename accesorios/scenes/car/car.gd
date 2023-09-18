extends KinematicBody2D

var speed = 150
var rotation_speed = 2.0
var bullet_spawn

func _ready():
	pass
	bullet_spawn = get_node("bullet_spawn")

func _physics_process(_delta):
	handle_movement(_delta)
	
	if Input.is_action_just_pressed("pew"):
		print("pew!")
		fire_weapon()

func handle_movement(delta):
	var move_vector = Vector2(0, 0)

	if Input.is_action_pressed("ui_up"):
		move_vector += Vector2(0, -1)

	if Input.is_action_pressed("ui_down"):
		move_vector += Vector2(0, 1)

	if Input.is_action_pressed("ui_left"):
		rotation -= rotation_speed * delta

	if Input.is_action_pressed("ui_right"):
		rotation += rotation_speed * delta

	move_and_slide(move_vector.rotated(rotation) * speed)

func fire_weapon():
	var bullet_direction = Vector2(0, -1).rotated(rotation)
	var bullet_scene = preload("res://accesorios/scenes/boolet/boolet.tscn")
	var bullet = bullet_scene.instance()
	bullet.direction = bullet_direction

	bullet_spawn.add_child(bullet)
	bullet.add_to_group("bullets")
	
	var bullet_timer = Timer.new()
	bullet_timer.wait_time = 10.0  # 10 seconds
	bullet_timer.one_shot = true
	bullet_timer.connect("timeout", self, "_on_bullet_timer_timeout", [bullet])
	bullet.add_child(bullet_timer)
	bullet_timer.start()

func _on_Control_fire_button_pressed():
	fire_weapon()

func _on_Control_back():
	# Handle backward movement here
	var move_vector = Vector2(0, 1)  # Move in the opposite direction of the character's facing
	move_vector = move_vector.rotated(rotation)  # Rotate the movement vector according to character's rotation
	move_and_slide(move_vector * speed)

func _on_Control_left():
	# Handle left movement here
	var move_vector = Vector2(-1, 0)  # Move to the left
	move_vector = move_vector.rotated(rotation)  # Rotate the movement vector according to character's rotation
	move_and_slide(move_vector * speed)

func _on_Control_right():
	# Handle right movement here
	var move_vector = Vector2(1, 0)  # Move to the right
	move_vector = move_vector.rotated(rotation)  # Rotate the movement vector according to character's rotation
	move_and_slide(move_vector * speed)
	
func _on_Control_accelerate():
	var move_vector = Vector2(0, -1)  # Move to the right
	move_vector = move_vector.rotated(rotation)  # Rotate the movement vector according to character's rotation
	move_and_slide(move_vector * speed)
