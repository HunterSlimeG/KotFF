extends CharacterBody2D

var stats = Data.load_data(Global.stats_path)
var SPEED = 500.0
var HEALTH = 100.0
var MAXHEALTH = 100.0
var MANA = 50.0
var direction: Vector2
var Dead = false
var moveable = true

func _ready() -> void:
	stats = Data.load_data(Global.stats_path)

	position = Vector2(stats.pos_x, stats.pos_y)
	SPEED = stats.speed
	HEALTH = stats.health
	MAXHEALTH = stats.max_health
	MANA = stats.mana
	gui()

func _exit_tree() -> void:
	stats.speed = SPEED
	stats.health = HEALTH
	stats.max_health = MAXHEALTH
	stats.mana = MANA
	stats.pos_x = position.x
	stats.pos_y = position.y
	Data.save_data(stats, Global.stats_path)
	
func _process(delta: float) -> void:
	heart()
	gui()
func _physics_process(delta: float) -> void:
	if moveable && !Global.menu:
		direction = Input.get_vector("Left", "Right", "Up", "Down")
		if direction:
			velocity.x = direction.x * SPEED
			velocity.y = direction.y * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			velocity.y = move_toward(velocity.y, 0, SPEED)
	else:
		velocity = Vector2(0, 0)
	move_and_slide()

func damage(val):
	HEALTH -= val

func heal(val):
	HEALTH += val

func mana(val):
	MANA += val

func gui():
	$Control/HealthBar.max_value = MAXHEALTH
	$Control/HealthBar.value = HEALTH
	$Control/ManaBar.value = MANA
	if Dead:
		$Timer.start()
		Dead = false
		moveable = false
	if HEALTH <= 0 and !Dead and moveable:
		Dead = true
		$Control/HealthBar/Heart.play("Death")

func heart():
	var healthPer = HEALTH / MAXHEALTH
	if not $Control/HealthBar/Heart.is_playing() and !Dead:
		if healthPer <= 0.25:
			$Control/HealthBar/Heart.speed_scale = 2.0
			$Control/HealthBar/Heart.play("Beat")
		elif healthPer <= 0.5:
			$Control/HealthBar/Heart.speed_scale = 1.0
			$Control/HealthBar/Heart.play("Beat")
		elif healthPer <= 0.75:
			$Control/HealthBar/Heart.speed_scale = 0.6
			$Control/HealthBar/Heart.play("Beat")


func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://Scenes/Death.tscn")
