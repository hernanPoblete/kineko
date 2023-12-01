extends Node

var ColorGlobal = -1:
	get: return ColorGlobal
	set(ColorNuevo):
		ColorGlobal = ColorNuevo

var color_file
var Colores = [Color(1,0,0), Color(0,1,0), Color(0,0,1)]

var PP = false

func refrescar():
	color_file = JSON.parse_string(FileAccess.open("user://color_data.json", FileAccess.READ).get_as_text())
	Colores = color_file.map(func(x): return Color(x[0], x[1], x[2]))
