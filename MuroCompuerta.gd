extends StaticBody2D

func _ready():
	$"Sprite2D".modulate = (((ColorGlobal.Colores[0]+ColorGlobal.Colores[1]+ColorGlobal.Colores[2]).inverted()/3)).inverted()
