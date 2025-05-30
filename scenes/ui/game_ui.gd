extends CanvasLayer
class_name GameUi

const MEDAL_BRONZE = preload("res://assets/sprites/UI/medalBronze.png")
const MEDAL_GOLD = preload("res://assets/sprites/UI/medalGold.png")
const MEDAL_SILVER = preload("res://assets/sprites/UI/medalSilver.png")

@onready var medal: TextureRect = %medal
@onready var current_score: Label = %current_score
@onready var high_score: Label = %high_score

@onready var score_label: Label = %score_label
@onready var start_menu: Control = %start_menu
@onready var game_over_menu: VBoxContainer = %game_over_menu


func _ready() -> void:
	score_label.text="0"
	
func update(value: int) -> void:
	score_label.text= str(value)

func calculate_score(score: int, high: int) -> void:
	current_score.text = str(score)
	high_score.text = str(high)
	if score >= 20:
		medal.texture = MEDAL_GOLD
	elif score >= 10:
		medal.texture = MEDAL_SILVER
	else:
		medal.texture = MEDAL_BRONZE
		
func game_over() -> void:
	game_over_menu.show()
	score_label.hide()

func _on_play_button_pressed() -> void:
	get_tree().reload_current_scene()
