extends VBoxContainer


@onready var jugar = %Jugar
@onready var config = %Config
@onready var creditos = %Creditos
@onready var salir = %Salir
@onready var color

#Checkea si existe un archivo con los colores. Crea uno default si no existe
func check_colors()->void:
	if not FileAccess.file_exists("user://color_data.json"):
		var default_colors = [[1,0,0],[0,1,0],[0,0,1]]
		var f = FileAccess.open("user://color_data.json", FileAccess.WRITE)
		f.store_string(JSON.stringify(default_colors))
		f.close()
		color = default_colors.map(func(x): return Color(x[0], x[1], x[2]))
	else:
		var f = FileAccess.open("user://color_data.json", FileAccess.READ)
		var data = JSON.parse_string(f.get_as_text())

		color = data.map(func(x): return Color(x[0], x[1], x[2]))
	RenderingServer.set_default_clear_color(Color(0,0,0))

func _ready() -> void:
	check_colors()
	jugar.pressed.connect(_on_jugar_pressed)
	config.pressed.connect(_on_config_pressed)
	creditos.pressed.connect(_on_creditos_pressed)
	salir.pressed.connect(_on_salir_pressed)
	
func _on_jugar_pressed():
	get_tree().change_scene_to_file("res://pruebas_de_nabil_u_w_u.tscn")
	ColorGlobal.refrescar()
func _on_salir_pressed():
	get_tree().quit()
func _on_config_pressed():
	get_tree().change_scene_to_file("res://menus/colors.tscn")
func _on_creditos_pressed():
	get_tree().change_scene_to_file("res://menus/creditos.tscn")
