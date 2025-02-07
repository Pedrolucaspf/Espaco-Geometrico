extends RigidBody2D

var target: Node2D
const LASER = preload("res://laser.tscn")

func _physics_process(_delta):
	if(target):
		$RayCast2D.target_position = target.position - global_position
		if($RayCast2D.is_colliding()):
			var obj = $RayCast2D.get_collider()
			if(obj is Foguete):
		#		print("FOGUETE DETECTADO")
				shoot_laser()
		#	else:
		#		print("Objeto no caminho")
		#else:
		#	print("Sem colisao")	
			
		
func shoot_laser() -> bool:
	var laser_dir = target.position - global_position
	if not (($Cooldown.is_stopped()) or ((laser_dir.x + laser_dir.y)**2 < 300**2)):
		return false
		
	var laser := LASER.instantiate() as Laser
	laser.look_at(target.global_position)
	laser.linear_velocity = -1*Vector2(laser.speed, 0).rotated(laser.rotation)
	get_tree().current_scene.add_child(laser)
	laser.global_position = global_position
	$Cooldown.start()
	return true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.play()



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_foguete_moving(rocket: Node2D) -> void:
	target = rocket
