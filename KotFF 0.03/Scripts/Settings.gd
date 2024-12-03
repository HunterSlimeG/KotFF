extends Control

var data = {}
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	data = Data.load_data(Data.save_path)
	if data.fullscreen_on:
		$Settings/TabContainer/General/MarginContainer/Fullscreen.select(1)
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		$Settings/TabContainer/General/MarginContainer/Fullscreen.select(0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_save_pressed() -> void:
	Data.save_data(data, Data.save_path)

func _on_apply_pressed() -> void:
	if data.fullscreen_on:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)

func _on_close_pressed() -> void:
	visible = false



func _on_fullscreen_item_selected(index: int) -> void:
	if index == 0:
		data.fullscreen_on = false
	else:
		data.fullscreen_on = true
