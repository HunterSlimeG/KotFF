extends TextureButton
var locked = true
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

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


func _on_lock_animation_finished() -> void:
	pass

func unlock():
	$Lock.play("default")
	button_mask = 1
	
func relock():
	$Lock.play_backwards("default")
	button_mask = 0


func _on_timer_timeout() -> void:
	if !locked:
		$Lock.visible = false
		button_mask = 1
