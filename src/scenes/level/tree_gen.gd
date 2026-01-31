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
	# TileMapLayer doesn’t own the TileSet; the parent TileMap does.
	var tilemap := get_parent()
	if tilemap == null or not (tilemap is TileMap):
		push_error("This TileMapLayer must be a child of a TileMap.")
		return

	var ts: TileSet = tilemap.tile_set
	if ts == null:
		push_error("TileMap has no TileSet assigned.")
		return

	var src := ts.get_source(tree_source_id)
	if src == null:
		push_error("No TileSet source with id %d" % tree_source_id)
		return

	var atlas := src as TileSetAtlasSource
	if atlas == null:
		push_error("Source id %d is not an Atlas source." % tree_source_id)
		return

	tree_tiles = atlas.get_tiles_ids()
	print("Found tiles in atlas source ", tree_source_id, ": ", tree_tiles.size())
	# Optional: print them so you can see the exact coords
	# print(tree_tiles)

func generate_trees() -> void:
	clear()

	if tree_tiles.is_empty():
		push_error("No tiles found in atlas source. Check slicing / source id.")
		return

	var placed := 0
	for x in range(min_x, max_x + 1):
		for y in range(min_y, max_y + 1):
			if randf() <= tree_chance:
				var atlas_coords := tree_tiles[randi() % tree_tiles.size()]
				set_cell(Vector2i(x, y), tree_source_id, atlas_coords)
				placed += 1

	print("Placed trees: ", placed)
