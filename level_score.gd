extends Node

var save_path = "user://gamesave.save"

var levelRankings: Array[int]
var levelNumber :int
var mortes: float
var planetas_v: float
var erros: float
var ranking: int
var pontos: float
var m_pontos: float
var e_pontos: float
var p_pontos: float
var lvlrk: int

func save():
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	file.store_var(levelRankings)
	file.close()
	
func resetSave():
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	levelRankings.resize(15)
	levelRankings.fill(0)
	file.store_var(levelRankings)
	file.close()

func loadGame():
	if(FileAccess.file_exists(save_path)):
		var file = FileAccess.open(save_path, FileAccess.READ)
		levelRankings = file.get_var()
		file.close()
	else:
		levelRankings.resize(15)
		levelRankings.fill(0)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	loadGame()

func calcScore() -> int:
	m_pontos = 3000 - (mortes * 1000)
	e_pontos = 5000 - (erros * 1000)
	p_pontos = 2000 - (planetas_v * 500)
	if(m_pontos<0):
		m_pontos = 0
	if(e_pontos<0):
		e_pontos = 0
	if(p_pontos<0):
		p_pontos = 0
	pontos = m_pontos + e_pontos + p_pontos
	if(pontos >= 7000):
		lvlrk = 3
	elif(pontos >= 3500):
		lvlrk = 2
	else:
		lvlrk = 1
	if(lvlrk > levelRankings[levelNumber - 1]):
		levelRankings[levelNumber - 1] = lvlrk
		save()
	return lvlrk

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
