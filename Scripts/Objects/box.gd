extends Area2D

@export var TILE_SIZE: int = 64
@onready var up: RayCast2D = $Up
@onready var down: RayCast2D = $Down
@onready var left: RayCast2D = $Left
@onready var right: RayCast2D = $Right

var moving: bool = false
const MOVE_TIME: float = 0.12

func can_be_pushed(dir: Vector2) -> bool:
	match dir:
		Vector2.RIGHT: return !right.is_colliding()
		Vector2.LEFT: return !left.is_colliding()
		Vector2.DOWN: return !down.is_colliding()
		Vector2.UP: return !up.is_colliding()
	return false


func toggle_moving() -> void:
	moving = !moving


func move_to_tile(dir) -> void:
	toggle_moving()
	var tween := create_tween()
	var target_position = position + dir * TILE_SIZE
	
	tween.tween_property(self, "position", target_position, MOVE_TIME)\
	.set_trans(Tween.TRANS_SINE)\
	.set_ease(Tween.EASE_IN_OUT)
	
	tween.finished.connect(toggle_moving)
