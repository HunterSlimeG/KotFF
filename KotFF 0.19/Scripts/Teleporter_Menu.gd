extends Control

var teleporters : Array
var activater : String
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_item_list_item_selected(index: int) -> void:
	owner.get_node(activater).activated(owner.get_node($ItemList.get_item_text(index)+" Teleporter"))
	$ItemList.deselect_all()
	$"../../Interaction".call("active", 0)
	Global.menu = false


func update(ts):
	teleporters = ts
	$ItemList.clear()
	for t in ts:
		$ItemList.add_item(t.replace(" Teleporter", ""), null, true)
