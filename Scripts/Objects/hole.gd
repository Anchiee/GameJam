extends Area2D

@onready var static_body_2d: Node2D = $StaticBody2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D


func _on_body_entered(body: Node2D) -> void:
	print("Box!")
	body.disable_collision()
	if static_body_2d:
		collision_shape_2d.queue_free()
	if collision_shape_2d:
		collision_shape_2d.position.y += 1000
