extends Node
class_name Spawner

signal on_obstacle_crash
signal on_player_score_spaw

const OBSTACLE_scene = preload("res://scenes/obstacle/obstacle.tscn")

@onready var timer: Timer = $Timer

func spawn_obstacle() -> void:
	var obs_instance: Obstacle = OBSTACLE_scene.instantiate()
	obs_instance.on_player_crashed.connect(_on_player_crashed)
	obs_instance.on_player_score.connect(_on_player_score)
	
	#obtener el tamaño de pantalla
	var viewport: Viewport = get_viewport()
	#posicionarlo en el eje x fuera de la pantalla a la derecha
	obs_instance.position.x = viewport.get_visible_rect().end.x + 150
	
	#obtener la mitad de la pantalla desde el eje y
	var half_height = viewport.size.y / 2
	#posicionarlo de forma aleatoria en el eje y
	obs_instance.position.y = randf_range(half_height + 240, half_height - 50)

	#añadir instancia 
	add_child(obs_instance)

func stop_obstacle() -> void:
	timer.stop()
	for i: Obstacle in get_children().filter(func(x): return x is Obstacle):
		i.set_speed(0)

func _on_player_crashed() -> void:
	on_obstacle_crash.emit()
	stop_obstacle()
	
func _on_player_score() -> void:
	on_player_score_spaw.emit()
	
func _on_timer_timeout() -> void:
	spawn_obstacle()
