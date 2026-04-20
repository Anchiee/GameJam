extends Node

var current_level = 1
const level_directory = "res://Scenes/World/"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func increase_room() -> void:
	current_level += 1

func change_room() -> void:
	increase_room()
	if current_level <= 4:
		get_tree().change_scene_to_file(level_directory + str(current_level) + ".tscn")
