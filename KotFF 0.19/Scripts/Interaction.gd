extends Control

@export_enum("Off:0","Teleporter:1", "Inventory:2", "Dialogue:3", "Storage:4") var mode : int = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = false
	Global.menu = false
	$Teleporter.visible = false
	$Inventory.visible = false
	#$Dialogue.visible = false
	#$Storage.visible = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_back_pressed() -> void:
	visible = false
	Global.menu = false
	$Teleporter.visible = false
	$Inventory.visible = false
	#$Dialogue.visible = false
	#$Storage.visible = false
func active(type: int):
	Global.menu = true
	mode = type
	visible = true
	if mode == 0:
		Global.menu = false
		visible = false
		$Teleporter.visible = false
		$Inventory.visible = false
		#$Dialogue.visible = false
		#$Storage.visible = false
	elif mode == 1:
		$Teleporter.visible = true
	elif mode == 2:
		$Inventory.visible = true
	elif mode == 3:
		$Dialogue.visible = true
	elif mode == 4:
		$Storage.visible = true
