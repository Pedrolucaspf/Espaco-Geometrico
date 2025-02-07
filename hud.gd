extends CanvasLayer

# Notifies `Main` node that the button has been pressed

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$TextureRect2/Timer1.start()
	$TextureRect3/Timer2.start()
	$TextureRect5/Timer4.start()
	$TextureRect6/Timer3.start()
	$GameManual.hide()
	$GameManual/Popup/Button.disabled = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func show_message(text):
	$Message.text = text
	$Message.show()
	$MessageTimer.start()
	
func show_game_over():
	show_message("Game Over")
	# Wait until the MessageTimer has counted down.
	await $MessageTimer.timeout

	$Message.text = "Espaço geométrico!"
	$Message.show()
	# Make a one-shot timer and wait for it to finish.
	await get_tree().create_timer(1.0).timeout
	$StartButton.show()
	
func update_score(score):
	$ScoreLabel.text = str(score)

func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://level_select.tscn")

func _on_timer_1_timeout() -> void:
	$TextureRect2/AnimationPlayer.play("animation1")

func _on_timer_2_timeout() -> void:
	$TextureRect3/AnimationPlayer.play("animation2")

func _on_timer_3_timeout() -> void:
	$TextureRect6/AnimationPlayer.play("animation4") 
	
func _on_timer_4_timeout() -> void:
	$TextureRect5/AnimationPlayer.play("animation3")

func _on_quit_button_pressed() -> void:
	get_tree().quit()

func _on_manual_button_pressed() -> void:
	$GameManual.show()
	$GameManual/Popup/Button.disabled = false
	$StartButton.disabled = true
	$ManualButton.disabled = true
	$DeleteSaveButton.disabled = true
	$QuitButton.disabled = true


func _on_game_manual_okbutton() -> void:
	$GameManual.hide()
	$GameManual/Popup/Button.disabled = true
	$StartButton.disabled = false
	$ManualButton.disabled = false
	$DeleteSaveButton.disabled = false
	$QuitButton.disabled = false


func _on_delete_save_button_pressed() -> void:
	$StartButton.disabled = true
	$ManualButton.disabled = true
	$DeleteSaveButton.disabled = true
	$QuitButton.disabled = true


func _on_data_excluder_okbutton() -> void:
	$StartButton.disabled = false
	$ManualButton.disabled = false
	$DeleteSaveButton.disabled = false
	$QuitButton.disabled = false
