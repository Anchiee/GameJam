extends Area2D

@export var dialogue: Node2D
@export var item_texture: Texture2D
@onready var texture_rect: TextureRect = $TextureRect


func _ready() -> void:
	texture_rect.texture = item_texture

func _on_body_entered(_body) -> void:
	dialogue.show()


func _on_area_entered(_area: Area2D) -> void:
	dialogue.show()
