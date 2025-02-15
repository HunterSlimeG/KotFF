extends Node

var json = JSON.new()
var stats_path1 = "user://Saves/File1/Stats.json"
var stats_path2 = "user://Saves/File2/Stats.json"
var stats_path3 = "user://Saves/File3/Stats.json"
var stats_paths = [stats_path1, stats_path2, stats_path3]
var interact_path1 = "user://Saves/File1/Interact.json"
var interact_path2 = "user://Saves/File2/Interact.json"
var interact_path3 = "user://Saves/File3/Interact.json"
var interact_paths = [interact_path1, interact_path2, interact_path3]
var save_path = "user://Saves/Settings.json"
var save_path2 = "user://Saves/"
var file_path = "user://Saves/File1"
var file_path2 = "user://Saves/File2"
var file_path3 = "user://Saves/File3"


func _ready():
	create_file()
	
func save_data(content, path):
	var file = FileAccess.open(path, FileAccess.WRITE)
	file.store_string(json.stringify(content))
	file.close()
	
func load_data(path):
	var file = FileAccess.open(path, FileAccess.READ)
	var content = json.parse_string(file.get_as_text())
	return content
	
func create_file():
	if not FileAccess.file_exists(save_path):
		DirAccess.make_dir_absolute(save_path2)
		var file = FileAccess.open("res://Scripts/Data/Default_Settings.json", FileAccess.READ)
		var content = json.parse_string(file.get_as_text())
		save_data(content, save_path)
	if not FileAccess.file_exists(file_path):
		DirAccess.make_dir_absolute(file_path)
	if not FileAccess.file_exists(file_path2):
		DirAccess.make_dir_absolute(file_path2)
	if not FileAccess.file_exists(file_path3):
		DirAccess.make_dir_absolute(file_path3)
	for i in stats_paths:
		if not FileAccess.file_exists(i):
			var file = FileAccess.open("res://Scripts/Data/Default_Stats.json", FileAccess.READ)
			var content = json.parse_string(file.get_as_text())
			save_data(content, i)
		else:
			pass
	for i in interact_paths:
		if not FileAccess.file_exists(i):
			var file = FileAccess.open("res://Scripts/Data/Default_Interact.json", FileAccess.READ)
			var content = json.parse_string(file.get_as_text())
			save_data(content, i)
		else:
			pass
	
