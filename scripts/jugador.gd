extends RigidBody2D

var llantas = []
var velocidad = 60000
var velocidad_max = 50
var vida = 60

func _ready():
	llantas = get_tree().get_nodes_in_group("llanta")
	get_parent().actualizar_vida(vida)

func _physics_process(delta):
	if Input.is_action_pressed("ui_right"):
		disminuir_vida(delta)
		for llanta in llantas:
			if llanta.angular_velocity < velocidad_max:
				llanta.apply_torque_impulse(velocidad * delta * 20)

	if Input.is_action_pressed("ui_left"):
		disminuir_vida(delta)
		for llanta in llantas:
			if llanta.angular_velocity > -velocidad_max:
				llanta.apply_torque_impulse(-velocidad * delta * 20)

	print(vida)

func actualizar_vida(value):
	vida = value
	get_parent().actualizar_vida(vida)

func disminuir_vida(delta):
	vida -= 10 * delta
	vida = clamp(vida, 0, 60)
	get_parent().actualizar_vida(int(vida))
	
	if vida <= 0:
		print("PERDISTE")
		get_tree().change_scene_to_file("res://scenes/perdiste.tscn")
