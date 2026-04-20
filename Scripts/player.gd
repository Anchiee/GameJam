extends Area2D

@export var SPEED: int = 5
@export var JUMP_VELOCITY: int = 350


func _physics_process(_delta: float) -> void:
	var direction := Input.get_vector("left", "right", "up", "down")
	
	if direction.length() > 1:
		direction = direction.normalized()
	
	position += direction * SPEED 
