extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$PauseButton.show()
	$PauseMenu.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_pause_button_pressed() -> void:
	if $PauseButton.visible:
		get_tree().paused = true
		$PauseButton.hide()
		$PauseMenu.show()


func _on_resume_button_pressed() -> void:
	if $PauseMenu.visible:
		$PauseMenu.hide()
		$PauseButton.show()
		get_tree().paused = false


func _on_level_select_button_pressed() -> void:
	if $PauseMenu.visible:
		get_tree().paused = false
		get_tree().change_scene_to_file("res://level_select.tscn")


func _on_quit_button_pressed() -> void:
	if $PauseMenu.visible:
		get_tree().quit()
