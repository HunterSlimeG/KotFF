extends Node2D

var direction : Vector2
var camera : Camera2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	camera = $Camera2D
	$Start.lock = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	Global.mouse = get_viewport().get_mouse_position()
	direction = Input.get_vector("Left", "Right", "Up", "Down")
	camera.position += direction*5


#func _on_control_2_gui_input(event: InputEvent) -> void:
	#if event is InputEventMouseMotion:
		#camera.position.y += 5
##
##
#func _on_control_gui_input(event: InputEvent) -> void:
	#if event is InputEventMouseMotion:
		#camera.position.y -= 5
