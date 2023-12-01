extends Area2D
var murov = preload("res://tiles/Cosas nabil uwu/murov.tscn")
var color = -1

#Called when the node enters the scene tree for the first time.
func _ready():
	body_entered.connect(_on_body_entered)
	color = ColorGlobal.ColorGlobal
	var object = murov.instantiate()
	add_child(object)
	$"Sprite2D".modulate = ColorGlobal.Colores[1]

func _on_body_entered(body):
	if color == 2:
		if body.has_method("kill"):
			body.kill()

func _process(delta):
	if color != ColorGlobal.ColorGlobal:
		if ColorGlobal.ColorGlobal == 0:
			if find_child("murov",true,false) == null:
				var object = murov.instantiate()
				add_child(object)
		
		if ColorGlobal.ColorGlobal == 1 or ColorGlobal.ColorGlobal == 2:
			if find_child("murov",true,false) != null:
				for nodo in find_children("murov","Object",true,false):
					nodo.queue_free()
			color = ColorGlobal.ColorGlobal
		else: color = ColorGlobal.ColorGlobal
	else: color = ColorGlobal.ColorGlobal
