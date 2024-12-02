extends TextureButton

@export var lock = true
var unlocked = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if unlocked:
		$Lock.play("default")
		unlocked = false
	elif !lock:
		$Lock.visible = false
		button_mask = 1
	elif lock:
		$Lock.visible = true
		button_mask = 0

func _on_mouse_entered() -> void:
	#if !lock:
	$Outline.visible = true


func _on_mouse_exited() -> void:
	$Outline.visible = false


func _on_toggled(toggled_on: bool) -> void:
	if toggled_on:
		disabled = true


func _on_lock_animation_finished() -> void:
	lock = false
