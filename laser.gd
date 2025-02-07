class_name Laser extends RigidBody2D

@export var speed = 400
#var dir : Vector2
#var angDefined : bool = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _physics_process(delta):
	pass
	var collision = move_and_collide(linear_velocity * delta)
	if collision:
		self.queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
