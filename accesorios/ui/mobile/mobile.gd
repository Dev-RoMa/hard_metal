extends Control

# Declare member variables here. Examples:
signal fire_button_pressed
signal accelerate
signal deaccelerate
signal on_back
signal off_back
signal on_left
signal off_left
signal on_right
signal off_right

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

#func _on_button_accelerate_pressed():
	#emit_signal("accelerate")


func _on_button_fire_pressed():
	emit_signal("fire_button_pressed")

func _on_button_exit_pressed():
	get_tree().change_scene("res://accesorios/main_menu/main_menu.tscn")

#func _on_button_accelerate_button_down():
	#emit_signal("accelerate")

#func _on_button_accelerate_button_up():
	#emit_signal("deaccelerate")


func _on_button_left_button_down():
	emit_signal("on_left")

func _on_button_right_button_down():
	emit_signal("on_right")

func _on_button_left_button_up():
	emit_signal("off_left")

func _on_button_right_button_up():
	emit_signal("off_right")	

func _on_button_back_button_up():
	emit_signal("on_back")

func _on_button_back_button_down():
	emit_signal("off_back")

func _on_button_accelerate_button_up():
	emit_signal("deaccelerate")

func _on_button_accelerate_button_down():
	emit_signal("accelerate")
