extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_texture_button_pressed() -> void:
	$AnimatedSprite2D.animation = "marcado"
	$AnimatedSprite2D.modulate = "ffffff"


func _on_texture_button_mouse_entered() -> void:
	if($AnimatedSprite2D.animation != "marcado"):
		$AnimatedSprite2D.modulate = "bdd5da"


func _on_texture_button_mouse_exited() -> void:
	$AnimatedSprite2D.modulate = "ffffff"
