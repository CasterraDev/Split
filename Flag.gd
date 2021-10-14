extends Area2D

export (String) var newScenePath;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Flag_body_entered(body):
	get_tree().change_scene(newScenePath)
