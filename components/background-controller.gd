extends Node2D

export (PackedScene) var Background = preload("res://components/background.tscn")


const BACKGROUND_WIDTH = 2048.0  # I wish we could get this from Background in compile time...
const BACKGROUND_DOUBLE_WIDTH = BACKGROUND_WIDTH * 2.0


var tiles = [null, null]  # This works by swapping two tiles' positions as needed
var covered_interval_left = -BACKGROUND_WIDTH / 2.0


func initialize_tiles():
	for i in range(2):
		var tile = Background.instance()
		tile.position.x = i * BACKGROUND_WIDTH
		tiles[i] = tile
		add_child(tile)


func ensure_tiles_cover_interval(x_min, x_max):
	if x_min < covered_interval_left:
		var pivot_tile = swap_tiles(1)
		pivot_tile.position.x -= BACKGROUND_DOUBLE_WIDTH
		covered_interval_left -= BACKGROUND_WIDTH
		
	elif covered_interval_right() < x_max:
		var pivot_tile = swap_tiles(0)
		pivot_tile.position.x += BACKGROUND_DOUBLE_WIDTH
		covered_interval_left += BACKGROUND_WIDTH


func swap_tiles(pivot_tile_index):
	var other_tile_index = (pivot_tile_index + 1) % 2
	
	var pivot_tile = tiles[pivot_tile_index]
	tiles[pivot_tile_index] = tiles[other_tile_index]
	tiles[other_tile_index] = pivot_tile
	
	return pivot_tile


func covered_interval_right():
	return covered_interval_left + BACKGROUND_DOUBLE_WIDTH


func _enter_tree():
	initialize_tiles()
