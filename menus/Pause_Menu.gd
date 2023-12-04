extends VBoxContainer

@onready var continuar = %Continuar
@onready var config = %Config
@onready var menu_principal = %MenuPrincipal
@onready var salir = %Salir


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	continuar.pressed.connect(_on_continuar_pressed)
	#config.pressed.connect(_on_config_pressed)
	menu_principal.pressed.connect(_on_menu_principal_pressed)
	salir.pressed.connect(_on_salir_pressed)
	hide()
	
func _input(event: InputEvent)-> void:
	if event.is_action_pressed("Pause"):
		visible = !visible
		get_tree().paused = visible
		
func _on_continuar_pressed():
	hide()
	get_tree().paused = false
func _on_menu_principal_pressed():
	get_tree().change_scene_to_file("res://menus/Main_Menu.tscn")
	get_tree().paused = false

#func _on_config_pressed():
#	get_tree().change_scene_to_file("res://menus/colors.tscn")
#	get_tree().paused = false
	
func _on_salir_pressed():
	get_tree().quit()



