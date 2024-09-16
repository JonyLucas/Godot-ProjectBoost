extends RigidBody3D

@export var boost_speed: float = 10.0
@export var turn_speed: float = 20.0
var apply_boost: bool = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("boost"):
		apply_boost = true
	
	if Input.is_action_pressed("turn_right"):
		apply_torque(Vector3(0, 0, -turn_speed * delta))
		# rotate_z(deg_to_rad(-turn_speed * delta))
	
	if Input.is_action_pressed("turn_left"):
		apply_torque(Vector3(0, 0, turn_speed * delta))
		# rotate_z(deg_to_rad(turn_speed * delta))

func _physics_process(delta: float) -> void:
	if apply_boost:
		var boost = transform.basis.y * boost_speed * delta # 3D Nodes stores rotation in basis
		apply_central_force(boost)
		apply_boost = false