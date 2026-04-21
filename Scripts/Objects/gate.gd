extends StaticBody2D

@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

func open() -> void:
	collision_shape_2d.set_deferred("disabled", true)
	
	collision_shape_2d.position.y += 1000


func close() -> void:
	collision_shape_2d.set_deferred("disabled", false)
	collision_shape_2d.position.y -= 1000
