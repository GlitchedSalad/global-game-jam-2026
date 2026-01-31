extends TileMapLayer

@export var tree_source_id: int = 0
@export var tree_chance: float = 0.15

@export var min_x: int = -30
@export var max_x: int = 30
@export var min_y: int = -30
@export var max_y: int = 30

var tree_tiles: Array[Vector2i] = []

func _ready() -> void:
	randomize()
	_cache_tree_tiles()
	generate_trees()

func _cache_tree_tiles() -> void:
	if tile_set == null:
		push_error("TileMapLayer has no TileSet assigned.")
		return

	var src = tile_set.get_source(tree_source_id)
	if src == null:
		push_error("No TileSet source with id %d" % tree_source_id)
		return

	tree_tiles.clear()
	var count := src.get_tiles_count()
	for i in range(count):
		var atlas_coords: Vector2i = src.get_tile_id(i) # atlas coords for that tile
		tree_tiles.append(atlas_coords)

	print("Found tiles in source ", tree_source_id, ": ", tree_tiles.size())
	# print(tree_tiles) # uncomment to see exact coords

func generate_trees() -> void:
	clear()

	if tree_tiles.is_empty():
		push_error("No tiles found in source. Check TileSet slicing / correct source id.")
		return

	var placed := 0
	for x in range(min_x, max_x):
		for y in range(min_y, max_y):
			if randf() <= tree_chance:
				var atlas_coords := tree_tiles[randi() % tree_tiles.size()]
				set_cell(Vector2i(x, y), tree_source_id, atlas_coords, 0) # alt_id = 0
				placed += 1

	print("Placed trees: ", placed)
