extends CharacterBody2D

@export var sensitivity : float = 0.005
@export var max_angle : float = 80
@onready var stick_pivot = $StickPivot

var speed = 200
var current_angle : float = 0.0


"""func _process(delta):
	var mouse_pos = get_global_mouse_position()
	var target_angle = (mouse_pos - stick_pivot.global_position).angle()
	
	stick_pivot.rotation = lerp_angle(stick_pivot.rotation, target_angle, 10.0 * delta)
"""

func _physics_process(delta: float) -> void:
	current_angle += Input.get_last_mouse_velocity().x * sensitivity
	current_angle = clamp(current_angle, -max_angle, max_angle)
	stick_pivot.rotation_degrees = current_angle
	
	
	var direction = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	velocity = direction * speed
	move_and_slide()
