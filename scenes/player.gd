extends CharacterBody2D

@export var gravity: float = 1000.0
@export var jump_force: float = 400.0
@export var max_speed: float = 400.0
@export var rotation_speed: float = 2.0

func _physics_process(delta: float) -> void:
	velocity.y += gravity * delta
	velocity.y = min(velocity.y , max_speed)
	
	if Input.is_action_pressed("jump"):
		jump()
		
	rotate_player()
	move_and_slide()
	
func jump() -> void:
	velocity.y =- jump_force
	rotation = deg_to_rad(-30)
	
func rotate_player() -> void: 	
	if velocity.y > 0 && rad_to_deg(rotation) < 90:
		rotation += rotation_speed * deg_to_rad(1)	
