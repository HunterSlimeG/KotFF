extends TextureButton
var locked = true
var gotten = false
@export var description : String
@export_enum("Misc:0","Class:1", "Ability:2", "Upgrade:3") var type : int = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
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
	pass

func unlock():
	locked = false
	$Lock.play("default")
	button_mask = 1
	
func relock():
	locked = true
	$Lock.play_backwards("default")
	button_mask = 0


func _on_timer_timeout() -> void:
	if !locked:
		$Lock.visible = false
		button_mask = 1
