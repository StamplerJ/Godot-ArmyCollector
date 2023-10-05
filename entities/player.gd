extends CharacterBody2D

@export var speed: int = 30

@onready var animator = $AnimationPlayer

func _physics_process(delta):
	handle_input(delta)
	move_and_slide()
	updateAnimation()
	
func handle_input(delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed * Globals.VELOCITY_MULTIPLIER * delta

func updateAnimation():
	if (velocity.length() == 0):
		if (animator.is_playing()):
			animator.stop()
	else:
		var direction = "down"
		if velocity.x > 0: direction = "right"
		if velocity.x < 0: direction = "left"
		if velocity.y < 0: direction = "up"
		
		animator.play("walk_" + direction)
