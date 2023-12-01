extends CharacterBody2D


const SPEED = 300.0
const push_speed = 500
var color_file = JSON.parse_string(FileAccess.open("user://color_data.json", FileAccess.READ).get_as_text())
var colors = color_file.map(func(x): return Color(x[0], x[1], x[2]))
var color_selected = -1
var rest = 0
@export var dead = false
@onready var animation_tree: AnimationTree = $AnimationTree
@onready var playback = animation_tree.get("parameters/playback")
var sleep = 300

func _ready():
	animation_tree.active = true
	playback.travel("run")
	
func _physics_process(delta: float)-> void:
	var direction_x = Input.get_axis("move_left", "move_right")
	var direction_y = Input.get_axis("move_up", "move_down")
	
	if (direction_x or direction_y):
		velocity.x = direction_x * SPEED/sqrt(direction_x**2 + direction_y**2)
		velocity.y = direction_y * SPEED/sqrt(direction_x**2 + direction_y**2)
		playback.travel("run")
		sleep = 300
	else:
		velocity.x = 0
		velocity.y = 0
		
		if sleep:
			sleep = sleep-1
		else:
			playback.travel("idle")
	
	
	
	if rest !=0:
		rest = rest-1
	move_and_slide()

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
			$"Gorrito".modulate = colors[color_selected]
			rest = rest + 60
