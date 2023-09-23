extends KinematicBody2D

var speed = 150
var rotation_speed = 2.0
var bullet_spawn
onready var audio = $AudioStreamPlayer2D


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
	bullet_timer.wait_time = 1.0  # 1 second
	bullet_timer.one_shot = true
	bullet_timer.connect("timeout", self, "_on_bullet_timer_timeout", [bullet])
	bullet.add_child(bullet_timer)
	bullet_timer.start()
	audio.play()

func _on_bullet_timer_timeout(bullet):
	bullet.queue_free()


func _on_Control_fire_button_pressed():
	fire_weapon()

func _on_Control_back():
	# Handle backward movement here
	var move_vector = Vector2(0, 1)  # Move in the opposite direction of the character's facing
	move_vector = move_vector.rotated(rotation)  # Rotate the movement vector according to character's rotation
	move_and_slide(move_vector * speed)

func _on_Control_accelerate():
	# Move the character forward continuously when the input is held down
	Input.action_press("ui_up")

func _on_Control_deaccelerate():
	Input.action_release("ui_up")

func _on_Control_on_left():
	Input.action_press("ui_left")

func _on_Control_off_left():
	Input.action_release("ui_left")

func _on_Control_off_right():
	Input.action_release("ui_right")

func _on_Control_on_right():
	Input.action_press("ui_right")

func _on_Control_on_back():
	Input.action_release("ui_down")

func _on_Control_off_back():
	Input.action_press("ui_down")
