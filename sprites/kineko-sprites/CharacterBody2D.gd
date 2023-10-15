class_name kineko
extends CharacterBody2D


const SPEED = 1000.0
const colors = [Color(0.95686, 0.81176, 0.70588), Color(0,1,0), Color(0,0,1)]
var color_selected = -1
var rest = 0

func _ready():
	ColorGlobal.ColorGlobal = color_selected

func _physics_process(delta: float)-> void:
	var direction_x = Input.get_axis("move_left", "move_right")
	var direction_y = Input.get_axis("move_up", "move_down")	
	

	if direction_x:
		velocity.x = direction_x * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		

	if direction_y:
		velocity.y = direction_y * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
	if direction_x and direction_y:
		velocity.x = direction_x*SPEED/1.41
		velocity.y = direction_y*SPEED/1.41
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
			$"Gorritowo".modulate = colors[color_selected]
			rest = rest + 60
func kill():
	position = Vector2(1050,40)
