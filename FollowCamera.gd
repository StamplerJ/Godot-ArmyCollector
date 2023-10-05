extends Camera2D

@export var tileMap: TileMap

func _ready():
	var mapRect = tileMap.get_used_rect()
	var tileSize = tileMap.cell_quadrant_size
	var worldSize = mapRect.size * tileSize
	limit_right = worldSize.x
	limit_bottom = worldSize.y
