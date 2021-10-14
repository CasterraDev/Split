extends KinematicBody2D

export (int) var speed = 120
export (int) var jumpForce = 180
export (int) var gravity = 400

export (float, 0, 1.0) var friction = .1
export (float, 0, 1.0) var acceleration = .25

var velocity = Vector2.ZERO


func get_input():
	var dir = 0
	if Input.is_action_pressed("right"):
		dir += 1
	if Input.is_action_pressed("left"):
		dir -= 1
	if (dir != 0):
		velocity.x = lerp(velocity.x,dir * speed, acceleration)
	else:
		velocity.x = lerp(velocity.x, 0, acceleration)

func _physics_process(delta):
	get_input()
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity,Vector2.UP)
	if (Input.is_action_just_pressed("jump")):
		if is_on_floor():
			velocity.y = -jumpForce


func _on_Area2D_body_entered(body):
	get_tree().change_scene("res://Level1.tscn")
