extends Spatial


## Flight speed
const SPEED := 10.0


# Random number generator
var _random := RandomNumberGenerator.new()

# Random target
var _target : Vector3

# Remaining time to new target
var _new_target : float


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Initialize the random number generator
	_random.randomize()
	
	# Pick a random position
	global_translation = _random_position()

	# Pick a random target
	_new_target = _random.randf_range(3.0, 6.0)
	_target = _random_position()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Update target
	_new_target -= delta
	if _new_target <= 0.0:
		_new_target = _random.randf_range(3.0, 6.0)
		_target = _random_position()

	# Turn towards the target
	var to_target = global_transform.looking_at(_target, Vector3.UP)
	global_transform = global_transform.interpolate_with(to_target, delta).orthonormalized()

	# Move forwards
	global_translation += -global_transform.basis.z * delta * SPEED

# Generate a random position
func _random_position() -> Vector3:
	return Vector3(
		_random.randf_range(-150.0, 150.0),
		_random.randf_range(-50.0, 50.0),
		_random.randf_range(-150.0, 150.0))
