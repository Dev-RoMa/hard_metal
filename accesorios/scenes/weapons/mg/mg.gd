extends Node2D

var boolet_scene = preload("res://accesorios/scenes/boolet/boolet.tscn")
onready var boolet_spawn = get_node("booletspawn")

func _ready():
	pass

func _process(delta):
	if Input.is_action_just_pressed("pew"):
		print("pew!")
		spawn_boolet()

func spawn_boolet():
	var new_boolet = boolet_scene.instance()
	
	# Access the position of the boolet_spawn area.
	var spawn_position = boolet_spawn.global_position
	
	# Set the position of the new bullet.
	new_boolet.transform.origin = spawn_position
	
	# Add the bullet to the parent of this node.
	get_parent().add_child(new_boolet)
