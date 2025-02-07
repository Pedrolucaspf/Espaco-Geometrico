extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_level_fim() -> void:
	$DeathCounterLabel.text = str(LevelScore.mortes)
	$ErrorCounterLabel.text = str(LevelScore.erros)
	$PlanetCounterLabel.text = str(LevelScore.planetas_v)
