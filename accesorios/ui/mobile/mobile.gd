extends Control

# Declare member variables here. Examples:
signal fire_button_pressed
signal accelerate
signal back
signal left
signal right

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_button_accelerate_pressed():
	emit_signal("accelerate")
	
func _on_button_back_pressed():
	emit_signal("back")

func _on_button_left_pressed():
	emit_signal("turn_left")

func _on_button_right_pressed():
	emit_signal("turn_right")

func _on_button_fire_pressed():
	emit_signal("fire_button_pressed")

func _on_button_exit_pressed():
	get_tree().change_scene("res://accesorios/main_menu/main_menu.tscn")
