extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	$"Save-Load".mode = 1
	$"Save-Load".visible = true
	


func _on_button2_pressed():
	$Settings.visible = true
	var data = Data.load_data(Data.save_path)
	
func _on_button3_pressed():
	get_tree().quit()
