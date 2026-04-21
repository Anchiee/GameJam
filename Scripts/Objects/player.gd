extends Area2D

@export var TILE_SIZE: int = 64
@onready var character_sprite: Sprite2D = $Sprite2D
@onready var up: RayCast2D = $Up
@onready var down: RayCast2D = $Down
@onready var left: RayCast2D = $Left
@onready var right: RayCast2D = $Right
@onready var b_up: RayCast2D = $BUp
@onready var b_down: RayCast2D = $BDown
@onready var b_left: RayCast2D = $BLeft
@onready var b_right: RayCast2D = $BRight


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
	
	if right.is_colliding():
		print("wall")
	if Input.is_action_just_pressed("right") and !right.is_colliding():
		dir.x = 1
		character_sprite.rotation = deg_to_rad(90)
		if b_right.is_colliding():
			print("box")
			dir.x = move_box(dir, b_right.get_collider())
	
	elif Input.is_action_just_pressed("left") and !left.is_colliding():
		dir.x = -1
		character_sprite.rotation = deg_to_rad(-90)
		if b_left.is_colliding():
			dir.x = move_box(dir, b_left.get_collider())
	
	elif Input.is_action_just_pressed("down") and !down.is_colliding():
		dir.y = 1
		character_sprite.rotation = deg_to_rad(180)
		if b_down.is_colliding():
			dir.y = move_box(dir, b_down.get_collider())
	
	elif Input.is_action_just_pressed("up") and !up.is_colliding():
		dir.y = -1
		character_sprite.rotation = deg_to_rad(0)
		if b_up.is_colliding():
			dir.y = move_box(dir, b_up.get_collider())
	
	return dir

func move_to_tile(dir) -> void:
	toggle_moving()
	var tween := create_tween()
	var target_position = position + dir * TILE_SIZE
	
	tween.tween_property(self, "position", target_position, MOVE_TIME)\
	.set_trans(Tween.TRANS_SINE)\
	.set_ease(Tween.EASE_IN_OUT)
	
	tween.finished.connect(toggle_moving)


func move_box(dir: Vector2, box: Node2D) -> float:
	if box.can_be_pushed(dir):
		box.move_to_tile(dir)
		return dir.x if dir.x != 0 else dir.y
	return 0


func toggle_moving() -> void:
	moving = !moving
