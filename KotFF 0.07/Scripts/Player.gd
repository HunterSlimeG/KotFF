extends CharacterBody2D

var stats : Dictionary
var SPEED = 500.0
var HEALTH = 100.0
var MAXHEALTH = 100.0
var MANA = 50.0
var direction: Vector2
var Dead = false

func _ready() -> void:
	stats = Data.load_data(Global.stats_path)
	SPEED = stats.speed
	HEALTH = stats.health
	MAXHEALTH = stats.max_health
	MANA = stats.mana
	$Control/HealthBar.max_value = MAXHEALTH
	print(stats.class)

func _process(delta: float) -> void:
	heart()
	if HEALTH <= 0:
		Dead = true
		$Control/HealthBar/Heart.play("Death")

func _physics_process(delta: float) -> void:
	direction = Input.get_vector("Left", "Right", "Up", "Down")
	if direction:
		velocity.x = direction.x * SPEED
		velocity.y = direction.y * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()

func damage(val):
	HEALTH -= val
	$Control/HealthBar.value = HEALTH

func heal(val):
	HEALTH += val
	$Control/HealthBar.value = HEALTH
	
func mana(val):
	MANA += val
	$Control/ManaBar.value = MANA


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
