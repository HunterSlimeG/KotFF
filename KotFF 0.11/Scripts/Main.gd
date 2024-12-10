extends Node2D

var player = Global.player
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	Global.menu = false
	player = Global.player
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Exit"):
		Global.menu = true
		$UI/Menu.visible = true

func _on_resume_pressed() -> void:
	Global.menu = false
	$UI/Menu.visible = false
	$"UI/Menu/Save-Load".visible = false

func _on_save_pressed() -> void:
	$"UI/Menu/Save-Load".mode = 0
	$"UI/Menu/Save-Load".visible = true


func _on_load_pressed() -> void:
	$"UI/Menu/Save-Load".mode = 1
	$"UI/Menu/Save-Load".visible = true


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Tree.tscn")
