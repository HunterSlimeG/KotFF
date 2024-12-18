extends Control

var animation: String
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_gui_input(event: InputEvent) -> void:
	pass

func _on_mouse_entered() -> void:
	$AnimatedSprite2D.play(animation)

func _on_mouse_exited() -> void:
	pass # Replace with function body.

func contains(item : String):
	if item=="":
		$AnimatedSprite2D.visible = false
	else:
		animation = item
