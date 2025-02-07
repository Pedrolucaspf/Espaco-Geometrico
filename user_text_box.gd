extends CanvasLayer

var ang: float
signal launch_sequence
signal correct
signal error

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_call_textbox(fig: Figura) -> void:
	$Label.text = "Insira o ângulo de lançamento:"
	$Label2.show()
	$LineEdit.show()
	ang = fig.ang_correto
	#global_position.x = fig.global_position.x - 100
	#global_position.y = fig.global_position.y + 300
	show()
	$Label3.hide()
	$TButton.hide()
	$TButton.disabled = true

func _on_line_edit_text_submitted(new_text: String) -> void:
	var inserted_angle = int(new_text)
	if inserted_angle != 0:
		if(inserted_angle == ang):
			$Label.text = "Correto!"
			$Label2.hide()
			$Label3.show()
			$LineEdit.hide()
			$TButton.show()
			$TButton.disabled = false
			correct.emit()
		else:
			$Label.text = "Errado"
			LevelScore.erros += 1
			error.emit()
	else:
		$Label.text = "Inválido."


func _on_button_pressed() -> void:
	launch_sequence.emit()
	hide()

	
