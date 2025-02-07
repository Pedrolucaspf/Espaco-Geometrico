extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
		$TextureRect/AnimationPlayer.play("new_animation")
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_button_v_pressed() -> void:
	get_tree().change_scene_to_file("res://hud.tscn")


func _on_button_1_pressed() -> void:
	get_tree().change_scene_to_file("res://level_01.tscn")


func _on_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://level_02.tscn")



func _on_button_3_pressed() -> void:
	get_tree().change_scene_to_file("res://level_03.tscn")
