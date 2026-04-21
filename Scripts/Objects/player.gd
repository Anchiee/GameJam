extends Area2D

@export var TILE_SIZE: int = 64
@onready var character_sprite: Sprite2D = $Sprite2D

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
		character_sprite.rotation = deg_to_rad(90)

	elif Input.is_action_just_pressed("left"):
		dir.x = -1
		character_sprite.rotation = deg_to_rad(-90)

	elif Input.is_action_just_pressed("down"):
		dir.y = 1
		character_sprite.rotation = deg_to_rad(180)

	elif Input.is_action_just_pressed("up"):
		dir.y = -1
		character_sprite.rotation = deg_to_rad(0)

	return dir

func move_to_tile(dir) -> void:
	toggle_moving()
	var tween := create_tween()
	var target_position = position + dir * TILE_SIZE
	
	tween.tween_property(self, "position", target_position, MOVE_TIME)\
	.set_trans(Tween.TRANS_SINE)\
	.set_ease(Tween.EASE_IN_OUT)
	
	tween.finished.connect(toggle_moving)
	

func toggle_moving() -> void:
	moving = !moving
