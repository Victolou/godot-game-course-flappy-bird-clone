extends CharacterBody2D
class_name Player

signal on_game_started

@export var gravity: float = 1000.0
@export var jump_force: float = 400.0
@export var max_speed: float = 400.0
@export var rotation_speed: float = 2.0

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var jump_audio: AudioStreamPlayer = $jump_audio

var started: bool = false
var process_input: bool = true

func _physics_process(delta: float) -> void:
	
	if Input.is_action_pressed("jump") && process_input:
		jump()
	
	if started == false:
		return
		
	velocity.y += gravity * delta
	velocity.y = min(velocity.y , max_speed)
	
	move_and_slide()
	rotate_player()
	
func jump() -> void:
	if started != true:
		started = true
		on_game_started.emit()

	velocity.y =- jump_force
	rotation = deg_to_rad(-30)
	jump_audio.play()
	
func rotate_player() -> void: 	
	if velocity.y > 0 && rad_to_deg(rotation) < 90:
		rotation += rotation_speed * deg_to_rad(1)	
		
func stop_movement() -> void:
	process_input = false
	
func stop_gravity() -> void:
	gravity = 0
	velocity = Vector2.ZERO
