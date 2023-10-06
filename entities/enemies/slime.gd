extends CharacterBody2D

@export var speed: int = 20
@export var limit: float = 0.2
@export var patrolMarker: Marker2D

@onready var animator = $AnimationPlayer

var startPosition: Vector2
var endPosition: Vector2

func _ready():
	animator.play("default")
	
	startPosition = position
	if (patrolMarker):
		endPosition = patrolMarker.global_position
	
func updateVelocity(delta: float):
	var direction: Vector2 = (endPosition - position).normalized()
	velocity = direction * speed * Globals.VELOCITY_MULTIPLIER * delta
	
func _physics_process(delta):
	if (patrolMarker):
		updateVelocity(delta)
	move_and_slide()
	
	if (patrolMarker and position.distance_to(endPosition) < limit):
		changeDirection()
	
func changeDirection():
	var temp = startPosition
	startPosition = endPosition
	endPosition = temp
