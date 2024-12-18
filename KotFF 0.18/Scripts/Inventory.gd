extends Control
var stats : Dictionary

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	stats = Data.load_data(Global.stats_path)
	var x = 0
	for slot in stats.inventory.slots[0]:
		get_node("Slot 0,"+str(x)).contains(slot)
		x += 1
	x = 0
	for slot in stats.inventory.slots[1]:
		get_node("Slot 1,"+str(x)).contains(slot)
		x += 1
	x = 0
	for slot in stats.inventory.gear:
		if x==0:
			get_node("Weapon").contains(slot)
		elif x>0 && x<4:
			get_node("Quick "+str(x)).contains(slot)
		elif x>3:
			get_node("Gear "+str(x-3)).contains(slot)
		x += 1
			

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
