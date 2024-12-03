extends Node2D

var direction : Vector2
var camera : Camera2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	camera = $Camera2D
	$Start.locked = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	Global.mouse = get_viewport().get_mouse_position()
	direction = Input.get_vector("Left", "Right", "Up", "Down")
	camera.position += direction*5



#Start
func _on_start_unlocked(toggled_on: bool) -> void:
	get_tree().call_group("Classes", "unlock")



#Classes
func _on_beserker_unlocked(toggled_on: bool) -> void:
	get_tree().call_group("Classes", "relock")
	$Beserker/Lock.visible = false 

func _on_sorcerer_unlocked(toggled_on: bool) -> void:
	get_tree().call_group("Classes", "relock")
	$Sorcerer/Lock.visible = false 

func _on_alchemist_unlocked(toggled_on: bool) -> void:
	get_tree().call_group("Classes", "relock")
	$Alchemist/Lock.visible = false 

func _on_druid_unlocked(toggled_on: bool) -> void:
	get_tree().call_group("Classes", "relock")
	$Druid/Lock.visible = false
	
func _on_engineer_unlocked(toggled_on: bool) -> void:
	get_tree().call_group("Classes", "relock")
	$Engineer/Lock.visible = false 

func _on_ranger_unlocked(toggled_on: bool) -> void:
	get_tree().call_group("Classes", "relock")
	$Ranger/Lock.visible = false
