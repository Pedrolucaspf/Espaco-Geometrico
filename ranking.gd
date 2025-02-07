extends Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$ColorRect/Estrela1.animation = "apagada"
	$ColorRect/Estrela2.animation = "apagada"
	$ColorRect/Estrela3.animation = "apagada"
	var lvlN = int(self.text)
	if(lvlN > 1 and LevelScore.levelRankings[lvlN-2] == 0):
		$Lock.show()
		self.disabled = true
	else:
		$Lock.hide()
		self.disabled = false
		var rank = LevelScore.levelRankings[lvlN - 1]
		if(rank >= 1):
			$ColorRect/Estrela1.animation = "acesa"
			if(rank >=2):
				$ColorRect/Estrela2.animation = "acesa"
				if(rank >= 3):
					$ColorRect/Estrela3.animation = "acesa"
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
