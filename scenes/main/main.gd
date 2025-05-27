extends Node2D

@onready var spawner: Spawner = $spawner
@onready var player: Player = $player

func _on_player_on_game_started() -> void:
	spawner.timer.start()

func _on_obstacle_on_player_crashed() -> void:
	pass

func _on_spawner_on_obstacle_crash() -> void:
	player.stop_movement()
