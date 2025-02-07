extends CanvasLayer

var rank: int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()
	$Popup/Button.disabled = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_fim() -> void:
	show()
	rank = LevelScore.calcScore()
	
	$EventStartTimer.start()
	await $EventStartTimer.timeout
	
	for i in range(LevelScore.mortes+1):
		$Popup/Metrics/DeathCounterLabel.text = str(i)
		$MetricsDelayTimer.start()
		await $MetricsDelayTimer.timeout
		
	for i in range(LevelScore.planetas_v+1):
		$Popup/Metrics/PlanetCounterLabel.text = str(i)
		$MetricsDelayTimer.start()
		await $MetricsDelayTimer.timeout
		
	for i in range(LevelScore.erros+1):
		$Popup/Metrics/ErrorCounterLabel.text = str(i)
		$MetricsDelayTimer.start()
		await $MetricsDelayTimer.timeout
	
	$EventStartTimer.start()
	await $EventStartTimer.timeout
	$Popup/Estrela_1.animation = "acesa"
	if(rank >=2):
		$StarDelayTimer.start()
		await $StarDelayTimer.timeout
		$Popup/Estrela_2.animation = "acesa"
		if(rank == 3):
			$StarDelayTimer.start()
			await $StarDelayTimer.timeout
			$Popup/Estrela_3.animation = "acesa"
	
	$EventStartTimer.start()
	await $EventStartTimer.timeout	
	$Popup/Button.disabled = false
	


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://level_select.tscn")
