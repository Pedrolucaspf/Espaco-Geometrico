extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Container/DeathCounterLabel.text = "0"
	$Container/ErrorCounterLabel.text = "0"
	$Container/PlanetCounterLabel.text = "0"
	show()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_foguete_hit() -> void:
	$Container/DeathCounterLabel.text = str(LevelScore.mortes)


func _on_user_text_box_error() -> void:
	$Container/ErrorCounterLabel.text = str(LevelScore.erros)


func _on_foguete_planet_reached() -> void:
	$Container/PlanetCounterLabel.text = str(LevelScore.planetas_v)


func _on_fim() -> void:
	hide()
