extends Control

@export_enum("Save:0","Load:1") var mode : int = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_file_1_pressed() -> void:
	if mode==1:
		get_tree().change_scene_to_file("res://Scenes/Main.tscn")


func _on_file_2_pressed() -> void:
	if mode==1:
		get_tree().change_scene_to_file("res://Scenes/Main.tscn")


func _on_file_3_pressed() -> void:
	if mode==1:
		get_tree().change_scene_to_file("res://Scenes/Main.tscn")
