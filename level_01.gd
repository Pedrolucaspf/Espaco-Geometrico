extends Node2D

var origem: Planeta
signal calc
signal invalid
signal fim
var destino: Planeta
var rank: int
@export var numLevel: int = 0

func launch(body: Node2D):
	if(body.global_position.x < origem.global_position.x):
		invalid.emit(body)
	else:
		if(body.global_position.y > origem.global_position.y) and ((abs(body.global_position.x) - abs($Foguete.global_position.x)) < 200):
			$UserTextBox.offset.x = 774
			$UserTextBox.offset.y = 112
		else:
			$UserTextBox.offset.x = 250
			$UserTextBox.offset.y = 400
		calc.emit(origem, body)
		destino = body

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	LevelScore.mortes = 0
	LevelScore.erros = 0
	LevelScore.planetas_v = 0
	LevelScore.levelNumber = numLevel
	origem = $Planeta_Ini
	$Foguete.start($StartPosition, PI)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_user_text_box_launch_sequence() -> void:
	$Foguete.launchDir(destino.position)
	
func _on_foguete_planet_reached() -> void:
	origem = destino


func _on_finish_line_body_entered(body: Node2D) -> void:
	if(body == $Foguete):
		$Pause/PauseButton.hide()
		fim.emit()
		#get_tree().change_scene_to_file("res://level_select.tscn")
