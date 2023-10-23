extends Area2D
var muroa = preload("res://tiles/Cosas nabil uwu/muroa.tscn")
var color = -1

#Called when the node enters the scene tree for the first time.
func _ready():
	body_entered.connect(_on_body_entered)
	color = ColorGlobal.ColorGlobal
	var object = muroa.instantiate()
	add_child(object)

func _on_body_entered(body):
	if color == 0:
		if body.has_method("kill"):
			body.kill()

func _process(delta):
	if color != ColorGlobal.ColorGlobal:
		if ColorGlobal.ColorGlobal == 1:
			if find_child("muroa",true,false) == null:
				var object = muroa.instantiate()
				add_child(object)
		
		if ColorGlobal.ColorGlobal == 2 or ColorGlobal.ColorGlobal == 0:
			if find_child("muroa",true,false) != null:
				for nodo in find_children("muroa","Object",true,false):
					nodo.queue_free()
			color = ColorGlobal.ColorGlobal
		else: color = ColorGlobal.ColorGlobal
	else: color = ColorGlobal.ColorGlobal
