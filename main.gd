extends Node

@onready var current_scene_container = $CurrentScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_tree().change_scene_to_file("res://hud.tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

# Variável para manter o score global
var score: int = 0
