extends Area2D

@onready var collision_shape_2d: Node2D = $StaticBody2D


func _on_body_entered(body: Node2D) -> void:
	print("Box!")
	body.disable_collision()
	if collision_shape_2d:
		collision_shape_2d.queue_free()
