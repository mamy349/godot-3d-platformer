extends CharacterBody3D

@export var speed := 7.0
@export var jump_force := 9.0
@export var mouse_sensitivity := 0.003

var gravity := 20.0
var shift_lock := false
var camera_yaw := 0.0
var camera_pitch := -0.2

var checkpoint_position := Vector3.ZERO

@onready var camera_pivot = $CameraPivot
@onready var camera = $CameraPivot/Camera3D
@onready var body = $Body

var coins := 0

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _unhandled_input(event):

	if event is InputEventMouseMotion:
		camera_yaw -= event.relative.x * mouse_sensitivity
		camera_pitch -= event.relative.y * mouse_sensitivity
		camera_pitch = clamp(camera_pitch, -1.0, 0.6)

		camera_pivot.rotation.x = camera_pitch
		camera_pivot.rotation.y = camera_yaw

	if event.is_action_pressed("shift_lock"):
		shift_lock = !shift_lock

		if shift_lock:
			camera.position.x = 2.5
		else:
			camera.position.x = 0

func _physics_process(delta):

	if not is_on_floor():
		velocity.y -= gravity * delta

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_force

	var input = Input.get_vector(
		"move_left",
		"move_right",
		"move_forward",
		"move_back"
	)

	var direction = Vector3(
		input.x,
		0,
		input.y
	)

	direction = direction.rotated(
		Vector3.UP,
		camera_yaw
	)

	if direction.length() > 0:
		direction = direction.normalized()

		velocity.x = direction.x * speed
		velocity.z = direction.z * speed

		if not shift_lock:
			body.rotation.y = lerp_angle(
				body.rotation.y,
				atan2(-direction.x, -direction.z),
				delta * 10
			)

	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.z = move_toward(velocity.z, 0, speed)

	if shift_lock:
		body.rotation.y = camera_yaw

	move_and_slide()

	if global_position.y < -20:
		respawn()

func set_checkpoint(position):
	checkpoint_position = position

func respawn():
	if checkpoint_position == Vector3.ZERO:
		global_position = Vector3(0, 5, 0)
	else:
		global_position = checkpoint_position + Vector3(0, 2, 0)
	velocity = Vector3.ZERO

func collect_coin(amount):
	coins += amount
	print("Coins: ", coins)
