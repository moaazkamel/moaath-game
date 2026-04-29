extends CharacterBody2D


var speed = 90.0


var jump_velocity = -300.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var coyote_time = 0.15 

var coyote_timer = 0.0




func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
		
		
		coyote_timer -= delta
	else:
		coyote_timer = coyote_time





	if Input.is_action_just_pressed("ui_accept") and coyote_timer > 0:
		velocity.y = jump_velocity
		coyote_timer = 0


	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		
		
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)

	move_and_slide()
