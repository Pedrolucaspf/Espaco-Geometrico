class_name Foguete extends CharacterBody2D

@export var speed = 400 # How fast the player will move (pixels/sec).
var screen_size # Size of the game window.
var orig: Marker2D

enum State {
	STOP,
	MOVE,
	DESTROYED
}

var _state := State.STOP
var dist

signal hit
signal planet_reached
signal moving

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func launchDir(pos):
	_state = State.MOVE
	dist = pos - global_position
	#print(dist)
	rotation = PI + dist.angle()
	#print(rotation)
	velocity = -1*Vector2(speed/4, 0).rotated(rotation)
	$AnimatedSprite2D.animation = "lançamento"
	$AnimatedSprite2D.play()

func verifyCollision(body: Node2D):
	velocity = Vector2(0, 0)
	$CollisionShape2D.disabled = true
	if (body is not Planeta):
		if (_state != State.DESTROYED):
			$AnimatedSprite2D.animation = "destruido"
			$AnimatedSprite2D.play()
			LevelScore.mortes += 1
			hit.emit()
			$DestroyTimer.start()
			_state = State.DESTROYED
	else:
		$AnimatedSprite2D.animation = "parado"
		_state = State.STOP
		LevelScore.planetas_v += 1
		planet_reached.emit()
		var newPosMarker = body.get_node("Marker2D")
		var planetAnim = body.get_node("AnimatedSprite2D")
		planetAnim.animation = "default"
		global_position = newPosMarker.global_position
		var new_dir = global_position - body.global_position
		rotation = -1*new_dir.angle()
		orig = newPosMarker
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	screen_size = get_viewport_rect().size

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		verifyCollision(collision.get_collider())
	if(_state == State.MOVE):
		moving.emit(self)


func start(startpos: Marker2D, newDir):
	_state = State.STOP
	$AnimatedSprite2D.animation = "parado"
	orig = startpos
	position = startpos.global_position
	rotation = newDir
#	print(rotation)
	velocity = Vector2(0, 0)
	show()
	$CollisionShape2D.disabled = true


func _on_animated_sprite_2d_animation_finished() -> void:
	if($AnimatedSprite2D.animation == "lançamento"):
		$CollisionShape2D.disabled = false
		velocity = -1*Vector2(speed, 0).rotated(rotation)
		$AnimatedSprite2D.animation = "movendo"
		$AnimatedSprite2D.play()


func _on_destroy_timer_timeout() -> void:
	$DestroyTimer.stop()
	_state = State.STOP
	$AnimatedSprite2D.animation = "parado"
	position = orig.global_position
