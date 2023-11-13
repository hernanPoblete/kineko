extends Control

var color_data = FileAccess.open("user://color_data.json", FileAccess.READ)
var color = JSON.parse_string(color_data.get_as_text()).map(
	func(x):return Color(x[0], x[1], x[2])
)


@onready var si = $HBoxContainer/si
@onready var no = $HBoxContainer/no
@onready var res = $HBoxContainer/res


func _ready():
	color_data.close()
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
	
	RenderingServer.set_default_clear_color((color[0]+color[1]+color[2]).inverted()/3)

func reset_colores():
	$"pickers/Color 0".color = Color(0,0,1)
	$"pickers/Color 1".color = Color(0,1,0)
	$"pickers/Color 2".color = Color(1,0,0)
func guardar_colores():
	var new_Colors = [
		[$"pickers/Color 0".color[0], $"pickers/Color 0".color[1], $"pickers/Color 0".color[2]],
		[$"pickers/Color 1".color[0], $"pickers/Color 1".color[1], $"pickers/Color 1".color[2]],
		[$"pickers/Color 2".color[0], $"pickers/Color 2".color[1], $"pickers/Color 2".color[2]],
	]
	
	var color_data = FileAccess.open("user://color_data.json", FileAccess.WRITE)
	color_data.store_string(JSON.stringify(new_Colors))
func menu_principal():
	get_tree().change_scene_to_file("res://menus/Main_Menu.tscn")


