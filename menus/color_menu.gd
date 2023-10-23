extends Control

#Poner en color la variable global de los colores (branch de Nabil)
@export var color: Array[Color]=[Color(0,0,1), Color(0,1,0), Color(1,0,0)]
@export var new: Array[Color]=color


@onready var si = $HBoxContainer/si
@onready var no = $HBoxContainer/no
@onready var res = $HBoxContainer/res

func _ready():
	$"preview/0".color = new[0]
	$"preview/1".color = new[1]
	$"preview/2".color = new[2]
	
	$"pickers/Color 0".color = color[0]
	$"pickers/Color 1".color = color[1]
	$"pickers/Color 2".color = color[2]
	
	
	si.pressed.connect(guardar_colores)
	no.pressed.connect(menu_principal)
	res.pressed.connect(reset_colores)



func _process(delta):
	new[0]=$"pickers/Color 0".color
	new[1]=$"pickers/Color 1".color
	new[2]=$"pickers/Color 2".color
	$"preview/0".color = new[0]
	$"preview/1".color = new[1]
	$"preview/2".color = new[2]

func reset_colores():
	get_tree().change_scene_to_file("res://menus/colors.tscn")
func guardar_colores():
	print("uwu")
func menu_principal():
	get_tree().change_scene_to_file("res://menus/inicio.tscn")


