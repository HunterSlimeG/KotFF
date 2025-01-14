extends Node2D

var player = Global.player
var interactData : Dictionary
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	Global.menu = false
	player = Global.player
	interactData = Data.load_data(Global.interact_path)
	for teleporter in interactData.teleporters:
		get_node(teleporter).unlocked = true
		get_node(teleporter).animation = "Unlock"
		get_node(teleporter).frame = 5
	$UI/Interaction/Teleporter.update(interactData.teleporters)
	
func _process(delta: float) -> void:
	pass

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Exit"):
		Global.menu = true
		$UI/Menu.visible = true
	if event.is_action_pressed("Inventory"):
		if !Global.menu:
			$UI/Interaction.call("active", 2)
		else:
			$UI/Interaction.call("active", 0)
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


func teleporterMenu(n):
	$UI/Interaction.call("active", 1)
	$UI/Interaction/Teleporter.activater = n
	
	
func teleporterUnlock(n):
	interactData.teleporters.append(n)
	Data.save_data(interactData, Global.interact_path)
	$UI/Interaction/Teleporter.update(interactData.teleporters)
