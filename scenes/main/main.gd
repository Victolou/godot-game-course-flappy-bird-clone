extends Node2D

const save_file = "user://score.save"

@onready var spawner: Spawner = $spawner
@onready var player: Player = $player
@onready var ground: Ground = $ground
@onready var game_ui: GameUi = $game_ui

var score: int = 0
var high: int = 0

func _ready() -> void:
	load_high_score()

func load_high_score() -> void:
	if FileAccess.file_exists(save_file):
		var file = FileAccess.open(save_file, FileAccess.READ)
		if file:
			high = file.get_32()
	else:
		high = 0

func save_high_score() -> void:
	if score > high:
		high = score
		var file = FileAccess.open(save_file, FileAccess.WRITE)
		if file:
			file.store_32(high)

func _on_player_on_game_started() -> void:
	spawner.timer.start()
	game_ui.start_menu.hide()
	player.animated_sprite_2d.play("fly")

func _on_spawner_on_obstacle_crash() -> void:
	player.stop_movement()
	ground.stop_ground(0)
	player.animated_sprite_2d.stop()

func _on_ground_on_player_crash() -> void:
	spawner.stop_obstacle()
	game_ui.calculate_score(score, high)
	game_ui.game_over()
	player.animated_sprite_2d.stop()

func _on_spawner_on_player_score_spaw() -> void:
	score += 1
	game_ui.update(score)
	save_high_score()
