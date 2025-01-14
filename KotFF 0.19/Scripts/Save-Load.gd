extends Control
var stats : Dictionary
@export_enum("Save:0","Load:1") var mode : int = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_file_1_pressed() -> void:
	if mode==1:
		Global.stats_path = "user://Saves/File1/Stats.json"
		Global.interact_path = "user://Saves/File1/Interact.json"
		Global.saveFile = 1
		get_tree().change_scene_to_file("res://Scenes/Main.tscn")
	else:
		Data.save_data(stats, "user://Saves/File1/Stats.json")
		visible = false

func _on_file_2_pressed() -> void:
	if mode==1:
		Global.stats_path = "user://Saves/File2/Stats.json"
		Global.interact_path = "user://Saves/File2/Interact.json"
		Global.saveFile = 2
		get_tree().change_scene_to_file("res://Scenes/Main.tscn")
	else:
		Data.save_data(stats, "user://Saves/File2/Stats.json")
		visible = false

func _on_file_3_pressed() -> void:
	if mode==1:
		Global.stats_path = "user://Saves/File3/Stats.json"
		Global.interact_path = "user://Saves/File3/Interact.json"
		Global.saveFile = 3
		get_tree().change_scene_to_file("res://Scenes/Main.tscn")
	else:
		Data.save_data(stats, "user://Saves/File3/Stats.json")
		visible = false

func _on_button_pressed() -> void:
	var file = FileAccess.open("res://Scripts/Data/Default_Stats.json", FileAccess.READ)
	var content = JSON.parse_string(file.get_as_text())
	Data.save_data(content, "user://Saves/File1/Stats.json")
	file = FileAccess.open("res://Scripts/Data/Default_Interact.json", FileAccess.READ)
	content = JSON.parse_string(file.get_as_text())
	Data.save_data(content, "user://Saves/File1/Interact.json")


func _on_button2_pressed() -> void:
	var file = FileAccess.open("res://Scripts/Data/Default_Stats.json", FileAccess.READ)
	var content = JSON.parse_string(file.get_as_text())
	Data.save_data(content, "user://Saves/File2/Stats.json")
	file = FileAccess.open("res://Scripts/Data/Default_Interact.json", FileAccess.READ)
	content = JSON.parse_string(file.get_as_text())
	Data.save_data(content, "user://Saves/File1/Interact.json")


func _on_button3_pressed() -> void:
	var file = FileAccess.open("res://Scripts/Data/Default_Stats.json", FileAccess.READ)
	var content = JSON.parse_string(file.get_as_text())
	Data.save_data(content, "user://Saves/File3/Stats.json")
	file = FileAccess.open("res://Scripts/Data/Default_Interact.json", FileAccess.READ)
	content = JSON.parse_string(file.get_as_text())
	Data.save_data(content, "user://Saves/File1/Interact.json")
