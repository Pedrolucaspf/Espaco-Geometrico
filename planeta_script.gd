class_name Planeta extends RigidBody2D

@export var id: int = 0
signal selected
signal launch_to

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D/Sprite2D.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_texture_button_pressed() -> void:
	$AnimatedSprite2D.animation = "marcado"
	$AnimatedSprite2D.modulate = "ffffff"
	selected.emit($TextureButton)
	launch_to.emit(self)

func _on_texture_button_mouse_entered() -> void:
	if($AnimatedSprite2D.animation != "marcado"):
		$AnimatedSprite2D.modulate = "bdd5da"


func _on_texture_button_mouse_exited() -> void:
	$AnimatedSprite2D.modulate = "ffffff"

func _on_selected(button: TextureButton):
	if(button != $TextureButton):
		$AnimatedSprite2D.animation = "default"
		$TextureButton.disabled = false
	else:
		$TextureButton.disabled = true


func _on_foguete_planet_reached() -> void:
	$TextureButton.disabled = false


func _on_foguete_hit() -> void:
	$TextureButton.disabled = false
	$AnimatedSprite2D.animation = "default"


func _on_level_01_invalid(body: Node2D) -> void:
	if(self == body):
		#print("Sim")
		$AnimatedSprite2D/Sprite2D.show()
		$TextureButton.disabled = true
		$AnimatedSprite2D.animation = "default"
		await get_tree().create_timer(1).timeout
		$AnimatedSprite2D/Sprite2D.hide()
		$TextureButton.disabled = false
	#else:
		#print("Nao")
