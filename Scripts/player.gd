extends CharacterBody2D

@export var SPEED: int = 300
@export var JUMP_VELOCITY: int = 350


func _physics_process(delta: float) -> void:
	var direction := Input.get_axis("left", "right")
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y -= JUMP_VELOCITY
	
	elif not is_on_floor():
		velocity += get_gravity() * delta
	
	move_and_slide()
