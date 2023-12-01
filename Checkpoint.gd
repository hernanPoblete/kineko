extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready():
	$"Sprite2D".modulate = (((ColorGlobal.Colores[0]+ColorGlobal.Colores[1]+ColorGlobal.Colores[2]).inverted()/3)).inverted()

func _on_body_entered(body):
	ColorGlobal.PP = true


func _on_body_exited(body):
	ColorGlobal.PP = false
