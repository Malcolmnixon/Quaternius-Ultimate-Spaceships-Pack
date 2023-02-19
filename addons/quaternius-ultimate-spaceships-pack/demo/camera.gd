extends Camera


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Handle mouse input
func _input(event):
	# Handle button presses
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_RIGHT:
				if event.pressed:
					Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
				else:
					Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

	# Handle mouse movement
	if event is InputEventMouseMotion:
		if event.button_mask & BUTTON_RIGHT:
			transform.basis *= Basis(
				Vector3(
					-event.relative.y / 200.0, 
					-event.relative.x / 200.0, 
					0.0))
