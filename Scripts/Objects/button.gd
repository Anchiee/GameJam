extends Area2D


var pressed: bool = false
@export var gate: StaticBody2D


func _on_body_entered(_body: Node2D) -> void:
	pressed = true
	print("Pressed")
	if gate:
		gate.open()


func _on_body_exited(_body: Node2D) -> void:
	pressed = false
	print("Unpressed")
	if gate:
		gate.close()
