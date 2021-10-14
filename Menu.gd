extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Start_pressed():
	get_tree().change_scene("res://Tut1.tscn")


func _on_Credits_pressed():
	get_tree().change_scene("res://Credits.tscn")


func _on_Exit_pressed():
	get_tree().quit()


func _on_Twitter_Button_pressed():
	OS.shell_open("https://twitter.com/casterradev")
