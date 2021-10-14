extends KinematicBody2D

export (int) var speed = 20
export (int) var gravity = 400

var velocity = Vector2.ZERO
export var direction = -1

func _ready():
	if (direction == 1):
		$AnimatedSprite.flip_h = true
	$floorCheck.position.x = $CollisionShape2D.shape.get_extents().x * direction

func _physics_process(delta):
	if is_on_wall() or not $floorCheck.is_colliding() and is_on_floor():
		direction *= -1
		$AnimatedSprite.flip_h = not $AnimatedSprite.flip_h
		$floorCheck.position.x = $CollisionShape2D.shape.get_extents().x * direction
		
	velocity.y += gravity
	velocity.x = speed * direction
	velocity = move_and_slide(velocity,Vector2.UP)


func _on_SideChecker_body_entered(body):
	print(body)
	if (body.get_name() == "Player" or body.get_name() == "Player2"):
		print("SIDE")
		get_tree().change_scene(get_tree().current_scene.filename)
