class_name Figura extends Node2D

@export var ang_correto: float
@export var p_origem: Planeta
@export var p_destino: Planeta
@export var secundaria: bool
#@export var fig = "triang_equilatero"

signal call_textbox

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()
	#$AnimatedSprite2D.animation = fig

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_user_text_box_correct() -> void:
	hide()


func _on_level_01_calc(orig, dest) -> void:
	if(orig == p_origem) and (dest == p_destino):
		show()
		if(secundaria == false):
			call_textbox.emit(self)
	else:
		hide()
