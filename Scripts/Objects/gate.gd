extends StaticBody2D

@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

func open() -> void:
	collision_shape_2d.disabled = true
	
	collision_shape_2d.position.y += 1000


func close() -> void:
	collision_shape_2d.disabled = false
	collision_shape_2d.position.y -= 1000
