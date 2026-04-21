extends Node2D
@onready var komiks: Sprite2D = $Komiks
@onready var the_end: Sprite2D = $TheEnd


func _on_timer_timeout() -> void:
	komiks.visible = false
	the_end.visible = true
