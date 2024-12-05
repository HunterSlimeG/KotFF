extends Node2D
var stats : Dictionary
var direction : Vector2
var camera : Camera2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	stats = Data.load_data(Global.stats_path)
	get_tree().call_group("Classes", "relock")
	if stats.class=="none":
		pass
	elif stats.class=="beserker":
		$Start.gotten = true
		$Beserker.locked = false
		$Beserker.gotten = true
	elif stats.class=="sorcerer":
		$Start.gotten = true
		$Sorcerer.locked = false
		$Sorcerer.gotten = true
	elif stats.class=="alchemist":
		$Start.gotten = true
		$Alchemist.locked = false
		$Alchemist.gotten = true
	elif stats.class=="druid":
		$Start.gotten = true
		$Druid.locked = false
		$Druid.gotten = true
	elif stats.class=="engineer":
		$Start.gotten = true
		$Engineer.locked = false
		$Engineer.gotten = true
	elif stats.class=="ranger":
		$Start.gotten = true
		$Ranger.locked = false
		$Ranger.gotten = true
	camera = $Camera2D
	$Start.locked = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	Global.mouse = get_global_mouse_position()
	direction = Input.get_vector("Left", "Right", "Up", "Down")
	camera.position += direction*5
	$Area2D.position = Global.mouse


func _on_button_pressed() -> void:
	Data.save_data(stats, Global.stats_path)
	get_tree().change_scene_to_file("res://Scenes/Main.tscn")


#Hover/Unhover
func _cursor_hover(area: Area2D):
	if area.get_parent().locked and !area.get_parent().gotten:
		$Camera2D/PanelContainer/VBoxContainer/Title.text = "Upgrade Locked"
		$Camera2D/PanelContainer/VBoxContainer/Description.text = "Another upgrade is needed to unlock this."
	else:
		$Camera2D/PanelContainer/VBoxContainer/Title.text = area.get_parent().name
		$Camera2D/PanelContainer/VBoxContainer/Description.text = area.get_parent().description
		#Upgrade Types
		if area.get_parent().type == 0:
			$Camera2D/PanelContainer/VBoxContainer/Warning.text = ""
		elif area.get_parent().type == 1 and !area.get_parent().gotten:
			$Camera2D/PanelContainer/VBoxContainer/Warning.text = "Only ONE class upgrade can be unlocked!"
		elif area.get_parent().type == 2:
			$Camera2D/PanelContainer/VBoxContainer/Warning.text = ""
		elif area.get_parent().type == 3:
			$Camera2D/PanelContainer/VBoxContainer/Warning.text = ""
		
	
func _cursor_unhover(area: Area2D):
	$Camera2D/PanelContainer/VBoxContainer/Title.text = "Hover over a upgrade for details."
	$Camera2D/PanelContainer/VBoxContainer/Warning.text = ""
	$Camera2D/PanelContainer/VBoxContainer/Description.text = ""


#Start
func _on_start_unlocked(toggled_on: bool) -> void:
	get_tree().call_group("Classes", "unlock")



#Classes
func _on_beserker_unlocked(toggled_on: bool) -> void:
	stats.class = "beserker"
	get_tree().call_group("Classes", "relock")
	$Beserker/Lock.visible = false 

func _on_sorcerer_unlocked(toggled_on: bool) -> void:
	stats.class = "sorcerer"
	get_tree().call_group("Classes", "relock")
	$Sorcerer/Lock.visible = false 

func _on_alchemist_unlocked(toggled_on: bool) -> void:
	stats.class = "alchemist"
	get_tree().call_group("Classes", "relock")
	$Alchemist/Lock.visible = false 

func _on_druid_unlocked(toggled_on: bool) -> void:
	stats.class = "druid"
	get_tree().call_group("Classes", "relock")
	$Druid/Lock.visible = false
	
func _on_engineer_unlocked(toggled_on: bool) -> void:
	stats.class = "engineer"
	get_tree().call_group("Classes", "relock")
	$Engineer/Lock.visible = false 

func _on_ranger_unlocked(toggled_on: bool) -> void:
	stats.class = "ranger"
	get_tree().call_group("Classes", "relock")
	$Ranger/Lock.visible = false