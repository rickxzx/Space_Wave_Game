extends CharacterBody2D
const JUMP_VELOCITY = -250.0
var  fly : bool = false
var rampa = 0
var run : bool = false

func _physics_process(delta: float) -> void:
	if $".".velocity.x <= 3 and run == true:
		$".".velocity.x = 300
	if rampa <= 50 and run == true:
		rampa += 50 * delta
	$".".velocity.x += rampa * delta
	# Add the gravity.
	if not is_on_floor() and fly == false:
		if $Bird.rotation <= 3.14/4:
			$Bird.rotation += 3.14/4 * delta
		velocity += get_gravity() * delta
	# Handle jump.
	if Input.is_action_pressed("ui_accept") and fly == false:
		if $Bird.rotation <= 3.14/2:
			if $Bird.rotation >= 0:
				$Bird.rotation = -0.2
		velocity.y = JUMP_VELOCITY
		fly = true
	if Input.is_action_just_released("ui_accept") and fly == true:
		fly = false
	move_and_slide()
