class_name kineko
extends CharacterBody2D


const SPEED = 300.0
var color_file = JSON.parse_string(FileAccess.open("user://color_data.json", FileAccess.READ).get_as_text())
var colors = color_file.map(func(x): return Color(x[0], x[1], x[2]))
var color_selected = -1
var rest = 0
var cel = preload("res://tiles/Cosas nabil uwu/celebracion.tscn")
@onready var animation_tree: AnimationTree = $AnimationTree
@onready var playback = animation_tree.get("parameters/playback")

func _ready():
	ColorGlobal.ColorGlobal = color_selected
	ColorGlobal.PP = false
	animation_tree.active = true



func _physics_process(delta: float)-> void:
	var direction_x = Input.get_axis("move_left", "move_right")
	var direction_y = Input.get_axis("move_up", "move_down")	
	
	var uncrasher = max(sqrt(direction_x**2 + direction_y**2), 1)
	velocity.x = direction_x * SPEED / uncrasher
	velocity.y = direction_y * SPEED / uncrasher
	if rest !=0:
		rest = rest-1

	move_and_slide()
	if abs(velocity.x) > 10 or abs(velocity.y)>10:
		playback.travel("run")
	else:
		playback.travel("idle")	

func _input(event: InputEvent) -> void:
	if rest == 0:
		if event.is_action_pressed("color_left"):
			#El +len(colors previene que en 0 el indice cambie a -1)
			color_selected = (color_selected-1+len(colors))%len(colors)
			ColorGlobal.ColorGlobal = color_selected
		elif event.is_action_pressed("color_right"):
			color_selected = (color_selected+1)%len(colors)
			ColorGlobal.ColorGlobal = color_selected

		
		if event.is_action_pressed("color_left") or event.is_action_pressed("color_right"):
			$"Gorritowo".modulate = colors[color_selected]
			rest = rest + 60
func kill():
	position = Vector2(0,0)
	
func win():
	var object = cel.instantiate()
	add_child(object)

#func check_box_collision(velocity):
#	var box : = get_slide_collision(0).collider as box
#	if box:
#		box.push(push_speed * velocity)
