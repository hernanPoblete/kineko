extends Area2D
var MuroCompuerta = preload("res://tiles/Cosas nabil uwu/muro_compuerta.tscn")


func _ready():
	var object = MuroCompuerta.instantiate()
	add_child(object)

func _process(delta):
	if ColorGlobal.PP == false:
		if find_child("MuroCompuerta",true,false) == null:
			var object = MuroCompuerta.instantiate()
			add_child(object)
	if ColorGlobal.PP == true:
		if find_child("MuroCompuerta",true,false) != null:
			for nodo in find_children("MuroCompuerta","Object",true,false):
				nodo.queue_free()

func rotar(n):
	rotate(n * PI/2)
