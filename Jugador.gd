extends CharacterBody2D

signal colision_con_enemigo

var speed = 300

# Tamaño del sprite
const SPRITE_SIZE = 128
const HALF_SIZE = 64.0

# Tamaño de la pantalla
const SCREEN_WIDTH = 1280
const SCREEN_HEIGHT = 720

func _ready():
	# Conectar señal de colisión del Area2D
	if has_node("Area2D"):
		$Area2D.body_entered.connect(_on_area_2d_body_entered)

func _physics_process(delta):
	var direction = Vector2.ZERO
	
	if Input.is_action_pressed("ui_right"):
		direction.x += 1
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	if Input.is_action_pressed("ui_down"):
		direction.y += 1
	if Input.is_action_pressed("ui_up"):
		direction.y -= 1
	
	velocity = direction.normalized() * speed
	move_and_slide()
	
	# Limitar posición EXACTAMENTE a los bordes visibles del sprite
	position.x = clamp(position.x, HALF_SIZE, SCREEN_WIDTH - HALF_SIZE)
	position.y = clamp(position.y, HALF_SIZE, SCREEN_HEIGHT - HALF_SIZE)

func _on_area_2d_body_entered(body):
	# Detectar colisión con enemigo
	if body.is_in_group("enemigo"):
		colision_con_enemigo.emit()
