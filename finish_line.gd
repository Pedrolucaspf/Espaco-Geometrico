extends Area2D

@export var col_t: float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$CollisionShape2D.scale.x = col_t
	$CollisionShape2D.scale.y = col_t


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
