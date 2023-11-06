extends VBoxContainer


@onready var jugar = %Jugar
@onready var config = %Config
@onready var creditos = %Creditos
@onready var salir = %Salir

#Checkea si existe un archivo con los colores. Crea uno default si no existe
func check_colors()->void:
	var c = FileAccess.open("user://color_data.json", FileAccess.WRITE_READ)
	if not c.get_as_text():
		var color_default = [[1,0,0],[0,1,0],[0,0,1]]
		c.store_string(JSON.stringify(color_default))

func _ready() -> void:
	check_colors()
	jugar.pressed.connect(_on_jugar_pressed)
	#config.pressed.connect(_on_config_pressed)
	#creditos.pressed.connect(_on_creditos_pressed)
	salir.pressed.connect(_on_salir_pressed)
	
func _on_jugar_pressed():
	get_tree().change_scene_to_file("res://levels/test/knight_moves.tscn")
func _on_salir_pressed():
	get_tree().quit()

