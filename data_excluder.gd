extends CanvasLayer

signal okbutton

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()
	$Popup/Button.disabled = true
	$Popup/Button2.disabled = true
	$Popup/Button3.disabled = true



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	LevelScore.resetSave()
	$Popup/RichTextLabel2.show()
	$Popup/Button3.show()
	$Popup/Button3.disabled = false
	$Popup/RichTextLabel.hide()
	$Popup/Button.hide()
	$Popup/Button2.hide()



func _on_button_2_pressed() -> void:
	$Popup/Button.disabled = true
	$Popup/Button2.disabled = true
	hide()
	okbutton.emit()


func _on_button_3_pressed() -> void:
		$Popup/Button3.disabled = true
		hide()
		okbutton.emit()


func _on_delete_save_button_pressed() -> void:
	show()
	$Popup/RichTextLabel2.hide()
	$Popup/Button3.hide()
	$Popup/Button.disabled = false
	$Popup/Button2.disabled = false
	
