class_name Tiles
extends TileMap

var Colisiones = preload("res://tiles/Cosas nabil uwu/muros_rojos.tscn")
var Data: Dictionary

func _ready():
	var cells = get_used_cells(0)
	for coords in cells:
		var tile_data = get_cell_tile_data(0, coords)
		Data[coords] = {"tipo": tile_data.get_custom_data("tipo")}


func get_tipo(coords):
	return Data[coords].tipo
# Called every frame. 'delta' is the elapsed time since the p
