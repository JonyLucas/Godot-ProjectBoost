extends Node3D

@export var boost_speed: float = 10.0
@export var turn_speed: float = 20.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("boost"):
		translate(Vector3(0, boost_speed * delta, 0))
	
	if Input.is_action_pressed("turn_right"):
		rotate_z(deg_to_rad(-turn_speed * delta))
	
	if Input.is_action_pressed("turn_left"):
		rotate_z(deg_to_rad(turn_speed * delta))

