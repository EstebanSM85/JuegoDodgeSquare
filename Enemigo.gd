extends CharacterBody2D

var speed = 150
var direction = Vector2.ZERO

func _ready():
	# Añadir al grupo de enemigos para identificación
	add_to_group("enemigo")
	reiniciar_direccion()

func reiniciar_direccion():
	# Generar nueva dirección aleatoria
	direction = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()

func _physics_process(delta):
	velocity = direction * speed
	move_and_slide()
	
	var margen = 16
	
	# Rebote horizontal
	if position.x <= margen:
		position.x = margen
		direction.x = abs(direction.x)
	elif position.x >= 1280 - margen:
		position.x = 1280 - margen
		direction.x = -abs(direction.x)
	
	# Rebote vertical
	if position.y <= margen:
		position.y = margen
		direction.y = abs(direction.y)
	elif position.y >= 720 - margen:
		position.y = 720 - margen
		direction.y = -abs(direction.y)
