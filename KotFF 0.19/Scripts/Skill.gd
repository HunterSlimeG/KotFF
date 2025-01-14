extends TextureButton
var locked = true
var gotten = false
@export var description : String
@export var descriptionLocked : String
@export_enum("Misc:0","Class:1", "Ability:2", "Upgrade:3") var type : int = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	descriptionLocked = "Another upgrade is needed to unlock this."
	if locked:
		button_mask = 0

func _process(delta: float) -> void:
	pass

func _on_mouse_entered() -> void:
	#if !lock:
	$Outline.visible = true


func _on_mouse_exited() -> void:
	$Outline.visible = false


func _on_toggled(toggled_on: bool) -> void:
	if toggled_on:
		disabled = true
		gotten = true


func _on_lock_animation_finished() -> void:
	if !locked:
		$Lock.visible = false

func unlock(play : bool):
	locked = false
	if play:
		$Lock.play("default")
	else:
		$Lock.stop()
	button_mask = 1
	
func relock(play: bool):
	$Lock.visible = true
	locked = true
	if play:
		$Lock.play_backwards("default")
	else:
		$Lock.stop()
	button_mask = 0
	descriptionLocked = "A conflicting upgrade has already been chosen."


func _on_timer_timeout() -> void:
	if !locked:
		$Lock.visible = false
		button_mask = 1
	if gotten:
		button_pressed = true
		disabled = true
