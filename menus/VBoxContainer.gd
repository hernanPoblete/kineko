extends VBoxContainer


@onready var jugar = %Jugar
@onready var config = %Config
@onready var creditos = %Creditos
@onready var salir = %Salir

func _ready() -> void:
	jugar.pressed.connect(_on_jugar_pressed)
	config.pressed.connect(_on_config_pressed)
	#creditos.pressed.connect(_on_creditos_pressed)
	salir.pressed.connect(_on_salir_pressed)
	
func _on_jugar_pressed():
	get_tree().change_scene_to_file("res://levels/test/knight_moves.tscn")
func _on_config_pressed():
	get_tree().change_scene_to_file("res://menus/colors.tscn")
func _on_salir_pressed():
	get_tree().quit()

