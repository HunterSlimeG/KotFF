extends AnimatedSprite2D

var unlocked = false
var cooldown = false
var target = self
signal unlock(n)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	unlock.connect(owner.teleporterUnlock)
	animation = "Unlock"
	frame = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if animation=="Use" and frame>=0:
		Global.menu = true

func _on_area_2d_area_entered(area: Area2D) -> void:
	if !unlocked:
		play("Unlock")
		unlock.emit(self.name)
		unlocked = true
		cooldown = true
	if !cooldown && unlocked:
		owner.teleporterMenu(self.name)
	$Timer.start()
	cooldown = true

func _on_timer_timeout() -> void:
	cooldown = false


func _on_animation_finished() -> void:
	if animation=="Unlock":
		cooldown = false
	if animation=="Use":
		Global.menu = false
		animation = "Unlock"
		frame = 5
		


func activated(tar, cur = ""):
	play("Use")
	Global.player.position = self.position+self.get_node("Marker2D").position*scale
	target = tar


func _on_frame_changed() -> void:
	if animation=="Use":
		if frame==7:
			cooldown = true
			Global.player.position = target.position+target.get_node("Marker2D").position*scale
			target.play_backwards("Use")
			target = self
