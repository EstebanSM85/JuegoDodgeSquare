extends Node2D

# Variables de juego
var tiempo := 0.0
var record := 0.0
var jugando := false

# Referencias a nodos
@onready var tiempo_label = $TiempoLabel
@onready var record_label = $RecordLabel
@onready var start_button = $StartButton
@onready var game_over_label = $GameOverLabel
@onready var jugador = $Jugador
@onready var tiempo_timer = $TiempoTimer
@onready var dificultad_timer = $DificultadTimer
@onready var musica_fondo = $MusicaFondo

# Array para múltiples enemigos
var enemigos = []

func _ready():
	# Cargar récord guardado
	cargar_record()
	# Iniciar música de fondo
	musica_fondo.play()
	
	# Obtener todos los enemigos del escenario
	for child in get_children():
		if child.is_in_group("enemigo"):
			enemigos.append(child)
	
	# Configurar estado inicial
	tiempo = 0.0
	jugando = false
	
	# Configurar UI inicial
	actualizar_labels()
	game_over_label.visible = false
	start_button.visible = true
	
	# Pausar el juego al inicio
	pausar_juego()

func _on_start_button_pressed():
	iniciar_juego()

func iniciar_juego():
	# Reiniciar tiempo
	tiempo = 0.0
	jugando = true
	
	# Ocultar botón de inicio y mensaje de game over
	start_button.visible = false
	game_over_label.visible = false
	
	# Reposicionar jugador al centro
	jugador.position = Vector2(640, 360)
	
	# Reposicionar TODOS los enemigos en posiciones aleatorias
	for enemigo_actual in enemigos:
		enemigo_actual.position = Vector2(randf_range(100, 1180), randf_range(100, 620))
		enemigo_actual.reiniciar_direccion()
		enemigo_actual.speed = 150  # Reiniciar velocidad inicial
	
	# Habilitar colisiones
	jugador.set_physics_process(true)
	for enemigo_actual in enemigos:
		enemigo_actual.set_physics_process(true)
	
	# Iniciar timers
	tiempo_timer.start()
	dificultad_timer.start()
	# Iniciar música de fondo
	musica_fondo.play()
	
	# Actualizar labels
	actualizar_labels()

func pausar_juego():
	jugando = false
	jugador.set_physics_process(false)
	
	# Pausar TODOS los enemigos
	for enemigo_actual in enemigos:
		enemigo_actual.set_physics_process(false)
	
	tiempo_timer.stop()
	dificultad_timer.stop()
	# Pausar música
	musica_fondo.stop()

func game_over():
	if not jugando:
		return
	
	jugando = false
	
	# Detener todo
	pausar_juego()
	
	# Actualizar récord si es necesario
	if tiempo > record:
		record = tiempo
		guardar_record()
		game_over_label.text = "¡NUEVO RÉCORD!\n" + str(round(tiempo * 10) / 10.0) + " segundos"
	else:
		game_over_label.text = "GAME OVER\nTiempo: " + str(round(tiempo * 10) / 10.0) + " s"
	
	# Mostrar UI de game over
	game_over_label.visible = true
	start_button.text = "REINTENTAR"
	start_button.visible = true
	
	# Actualizar labels
	actualizar_labels()

func _on_tiempo_timer_timeout():
	if jugando:
		tiempo += 0.1
		actualizar_labels()

func _on_dificultad_timer_timeout():
	if jugando:
		# Aumentar velocidad de TODOS los enemigos
		for enemigo_actual in enemigos:
			enemigo_actual.speed += 20
		
		# Mostrar mensaje en consola
		if enemigos.size() > 0:
			print("¡Velocidad aumentada! Nueva velocidad: ", enemigos[0].speed)

func actualizar_labels():
	tiempo_label.text = "Tiempo: " + str(round(tiempo * 10) / 10.0) + " s"
	record_label.text = "Récord: " + str(round(record * 10) / 10.0) + " s"

func guardar_record():
	var save_file = FileAccess.open("user://record.save", FileAccess.WRITE)
	if save_file:
		save_file.store_float(record)
		save_file.close()

func cargar_record():
	if FileAccess.file_exists("user://record.save"):
		var save_file = FileAccess.open("user://record.save", FileAccess.READ)
		if save_file:
			record = save_file.get_float()
			save_file.close()
	else:
		record = 0.0

func _on_jugador_colision_con_enemigo():
	game_over()
