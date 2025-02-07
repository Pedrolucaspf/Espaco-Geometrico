extends PathFollow2D

@export var speed: float = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	progress_ratio += 0.001 * speed
	$Asteroide.global_position = $Asteroide.global_position
