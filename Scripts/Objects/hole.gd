extends Area2D

@onready var static_body_2d: CollisionShape2D = $StaticBody2D/CollisionShape2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D


func _on_body_entered(body: Node2D) -> void:
	print("Box!")
	if body:
		body.disable_collision()
	if collision_shape_2d:
		collision_shape_2d.set_deferred("disabled", true)
	if static_body_2d:
		static_body_2d.queue_free()
	#if collision_shape_2d:
		#collision_shape_2d.position.y += 1000
