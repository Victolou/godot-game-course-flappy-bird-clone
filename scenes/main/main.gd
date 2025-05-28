extends Node2D

@onready var spawner: Spawner = $spawner
@onready var player: Player = $player
@onready var ground: Ground = $ground
@onready var game_ui: GameUi = $game_ui

var score: int = 0

func _on_player_on_game_started() -> void:
	spawner.timer.start()
	game_ui.start_menu.hide()

func _on_spawner_on_obstacle_crash() -> void:
	player.stop_movement()
	ground.stop_ground(0)

func _on_ground_on_player_crash() -> void:
	spawner.stop_obstacle()
	
func _on_spawner_on_player_score_spaw() -> void:
	score+=1
	game_ui.update(score)
