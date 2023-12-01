extends CharacterBody2D
var MuroCajaA = preload("res://tiles/Cosas nabil uwu/muro_caja_a.tscn")
var color = -1
var move_inputx = 0;
var move_inputy = 0;
var is_in_area = 0;

const SPEED = 200.0
const ACELERATION = 50

func _ready():
	color = ColorGlobal.ColorGlobal
	var object = MuroCajaA.instantiate()
	add_child(object)
	$"Sprite2D".modulate = ColorGlobal.Colores[2]

func _on_body_entered_Izq(body):
	if color == 1:
		if body.has_method("kill"):
			is_in_area = 1
			move_inputx = 1

func _on_body_exited_Izq(body):
	is_in_area = 0
	move_inputx = 0

func _on_body_entered_Der(body):
	if color == 1:
		if body.has_method("kill"):
			is_in_area = 1
			move_inputx = -1

func _on_body_exited_Der(body):
	is_in_area = 0
	move_inputx = 0

func _on_body_entered_Arr(body):
	if color == 1:
		if body.has_method("kill"):
			is_in_area = 1
			move_inputy = 1

func _on_body_exited_Arr(body):
	is_in_area = 0
	move_inputy = 0

func _on_body_entered_Aba(body):
	if color == 1:
		if body.has_method("kill"):
			is_in_area = 1
			move_inputy = -1

func _on_body_exited_Aba(body):
	is_in_area = 0
	move_inputy = 0
	
func _physics_process(delta):
	if is_in_area:
		velocity.x = move_toward(velocity.x,SPEED*move_inputx,ACELERATION*delta)
		velocity.y = move_toward(velocity.y,SPEED*move_inputy,ACELERATION*delta)
	else:
		velocity.x = move_toward(0, 0, 0)
		velocity.y = move_toward(0, 0, 0)

	move_and_slide()
	

func _process(delta):
	if color != ColorGlobal.ColorGlobal:
		if ColorGlobal.ColorGlobal == 1:
			if find_child("MuroCajaA",true,false) == null:
				var object = MuroCajaA.instantiate()
				add_child(object)
			color = ColorGlobal.ColorGlobal
		
		if ColorGlobal.ColorGlobal == 2 or ColorGlobal.ColorGlobal == 0:
			if find_child("MuroCajaA",true,false) != null:
				for nodo in find_children("MuroCajaA","Object",true,false):
					nodo.queue_free()
			color = ColorGlobal.ColorGlobal
		else: color = ColorGlobal.ColorGlobal
	else: color = ColorGlobal.ColorGlobal


func _on_area_2d_body_entered(body):
	if color == 0:
		if body.has_method("kill"):
			body.kill()
