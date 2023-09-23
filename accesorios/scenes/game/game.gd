extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_end"):
		print("leaving game!")
		change_to_main()


func _on_buttonm_exit_pressed():
	change_to_main()
	
func change_to_main():
	get_tree().change_scene("res://accesorios/main_menu/main_menu.tscn")
