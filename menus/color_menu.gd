extends Control

#Poner en color la variable global de los colores (branch de Nabil)
var color_data = FileAccess.open("user://color_data.json", FileAccess.READ_WRITE).get_as_text()
var c = JSON.parse_string(color_data).colors
@export var color: Array=c.map(
	func (x): return Color(x[0],x[1],x[2])
)



@onready var si = $HBoxContainer/si
@onready var no = $HBoxContainer/no
@onready var res = $HBoxContainer/res


func _ready():
	$"preview/0".color = color[0]
	$"preview/1".color = color[1]
	$"preview/2".color = color[2]
	
	$"pickers/Color 0".color = color[0]
	$"pickers/Color 1".color = color[1]
	$"pickers/Color 2".color = color[2]
	
	si.pressed.connect(guardar_colores)
	no.pressed.connect(menu_principal)
	res.pressed.connect(reset_colores)



func _process(delta):
	color[0]=$"pickers/Color 0".color
	color[1]=$"pickers/Color 1".color
	color[2]=$"pickers/Color 2".color
	$"preview/0".color = color[0]
	$"preview/1".color = color[1]
	$"preview/2".color = color[2]

func reset_colores():
	$"pickers/Color 0".color = Color(0,0,1)
	$"pickers/Color 1".color = Color(0,1,0)
	$"pickers/Color 2".color = Color(1,0,0)
func guardar_colores():
	var data = {
		"colors":[color[0], color[1], color[2]].map(
			func (x):return [x.r, x.g, x.b] 
		)
	}
	
	var data_string = JSON.stringify(data)
	var f = FileAccess.open("user://color_data.json", FileAccess.READ_WRITE)
	f.store_string(data_string)
func menu_principal():
	get_tree().change_scene_to_file("res://menus/Main_Menu.tscn")


