extends Node

var current_level = 1
const level_directory = "res://Scenes/World/%s.tscn"

func increase_room() -> void:
	current_level += 1

func change_room() -> void:
	increase_room()
	if current_level <= 8:
		get_tree().change_scene_to_file.call_deferred(level_directory % current_level)
