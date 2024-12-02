extends Node

var json = JSON.new()
var stats_path = "user://Saves/Stats.json"
var save_path = "user://Saves/Settings.json"
var save_path2 = "user://Saves/"
var file_path = "user://Saves/File1"
var file_path2 = "user://Saves/File2"
var file_path3 = "user://Saves/File3"

var data = {}
var fullscreen_on = false
var	display_fps = false
var	max_fps = 60
var brightness = 50
var	master_vol = 100
var	music_vol = 100
var	sfx_vol = 100
var mouse_sens = 1

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
	if not FileAccess.file_exists(file_path):
		DirAccess.make_dir_absolute(file_path)
	if not FileAccess.file_exists(file_path2):
		DirAccess.make_dir_absolute(file_path2)
	if not FileAccess.file_exists(file_path3):
		DirAccess.make_dir_absolute(file_path3)
	if not FileAccess.file_exists(save_path):
		DirAccess.make_dir_absolute(save_path2)
		var file = FileAccess.open("res://Scripts/Data/Default_Settings.json", FileAccess.READ)
		var content = json.parse_string(file.get_as_text())
		data = content
		save_data(data, save_path)
	if not FileAccess.file_exists(stats_path):
		DirAccess.make_dir_absolute(save_path2)
		var file = FileAccess.open("res://Scripts/Data/Default_Stats.json", FileAccess.READ)
		var content = json.parse_string(file.get_as_text())
		data = content
		save_data(data, stats_path)
	else:
		pass
	
