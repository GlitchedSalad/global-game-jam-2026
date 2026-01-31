extends TileMapLayer

@export var tree_source_id: int = 0   # Atlas source ID
@export var tree_tile_id: Vector2i    # Tile coords inside the atlas
@export var tree_chance := 0.15       # 15% chance per tile

@export var min_x := -30
@export var max_x := 30
@export var min_y := -30
@export var max_y := 30

func _ready():
	randomize()
	generate_trees()

func generate_trees():
	clear()

	for x in range(min_x, max_x + 1):
		for y in range(min_y, max_y + 1):
			if randf() <= tree_chance:
				set_cell(
					Vector2i(x, y),
					tree_source_id,
					tree_tile_id
				)
