extends Area2D

@export var TILE_SIZE: int = 64

var moving: bool = false
const MOVE_TIME: float = 0.12

func _process(_delta):
	
	if moving:
		return
	
	var dir := return_dir()

	if dir != Vector2.ZERO:
		move_to_tile(dir)

func return_dir() -> Vector2:
	var dir = Vector2.ZERO

	if Input.is_action_just_pressed("right"):
		dir.x = 1
	elif Input.is_action_just_pressed("left"):
		dir.x = -1
	elif Input.is_action_just_pressed("down"):
		dir.y = 1
	elif Input.is_action_just_pressed("up"):
		dir.y = -1
		
	return dir

func move_to_tile(dir) -> void:
	moving = !moving
	var tween := create_tween()
	var target_position = position + dir * TILE_SIZE
	
	tween.tween_property(self, "position", target_position, MOVE_TIME)\
	.set_trans(Tween.TRANS_SINE)\
	.set_ease(Tween.EASE_IN_OUT)
	
	tween.finished.connect(func():
		moving = false
	)
	
