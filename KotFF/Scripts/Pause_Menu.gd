extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_button2_pressed() -> void:
	$Settings.visible = true


func _on_button3_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Menu.tscn")


func _on_button4_pressed() -> void:
	pass


func _on_button5_pressed() -> void:
	pass # Replace with function body.
