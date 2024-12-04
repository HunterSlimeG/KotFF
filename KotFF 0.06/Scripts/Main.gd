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


func _on_save_pressed() -> void:
	pass # Replace with function body.


func _on_load_pressed() -> void:
	pass # Replace with function body.
