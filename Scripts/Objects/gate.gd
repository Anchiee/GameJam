extends StaticBody2D

@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@export var open_count: int = 1
var boxes_on_buttons: int = 0

func open() -> void:
	boxes_on_buttons += 1
	if boxes_on_buttons >= open_count:
		collision_shape_2d.set_deferred("disabled", true)
		collision_shape_2d.position.y += 1000


func close() -> void:
	boxes_on_buttons -= 1
	if boxes_on_buttons <= open_count:
		collision_shape_2d.set_deferred("disabled", false)
		collision_shape_2d.position.y -= 1000
