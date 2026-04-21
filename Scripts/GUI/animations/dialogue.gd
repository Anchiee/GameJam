extends AnimatedSprite2D

@onready var label: Label = $Label
@export var questio: String = ""
@export var dial1: String = ""
@export var dial2: String = ""
@export var dial3: String = ""
@export var dial4: String = ""
@onready var button: Button = $HBoxContainer/Button
@onready var button_2: Button = $HBoxContainer/Button2
@onready var button_3: Button = $HBoxContainer/Button3
@onready var button_4: Button = $HBoxContainer/Button4


func _ready() -> void:
	play("default")
	label.text = questio
	button.text = dial1
	button_2.text = dial2
	button_3.text = dial3
	button_4.text = dial4

func _on_button_pressed() -> void:
	LevelManager.change_room()


func _on_button_2_pressed() -> void:
	LevelManager.current_level -= 1
	get_tree().change_scene_to_file.call_deferred(LevelManager.level_directory % LevelManager.current_level)


func _on_button_3_pressed() -> void:
	LevelManager.current_level -= 1
	get_tree().change_scene_to_file.call_deferred(LevelManager.level_directory % LevelManager.current_level)


func _on_button_4_pressed() -> void:
	LevelManager.current_level -= 1
	get_tree().change_scene_to_file.call_deferred(LevelManager.level_directory % LevelManager.current_level)
