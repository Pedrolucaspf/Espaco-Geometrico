class_name Asteroide extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var tipoAsteroide = $AnimatedSprite2D.sprite_frames.get_animation_names()
	$AnimatedSprite2D.play(tipoAsteroide[randi() % tipoAsteroide.size()])


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
