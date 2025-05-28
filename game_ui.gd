extends CanvasLayer
class_name GameUi

@onready var score_label: Label = %score_label
@onready var start_menu: Control = %start_menu

func _ready() -> void:
	score_label.text="0"
	
func update(value: int) -> void:
	score_label.text= str(value)
