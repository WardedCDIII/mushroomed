/// @description Create map

lost = false; // If the player has lost the game
won = false; // If the player has won the game
if (room == rm_level_1 || room = rm_level_2) {
	player_score = 0; // The score for the player

	layer_set_visible("Map",false);
	layer_set_visible("GUI",true);
	layer_set_visible("Instances",true);

	// Map grid
	global.Map = ds_grid_create(MAP_W,MAP_H);
	var _tileMap = layer_tilemap_get_id("Map");

	// Populate global.Map
	for(var tx=0; tx<MAP_W; tx++) {
		for(var ty=0; ty<MAP_H; ty++) {
			var _tileMapData = tilemap_get(_tileMap,tx,ty);
			_tileMapData = tile_get_index(_tileMapData);
			var _tile = [-1, 0];
			_tile[TILE.SPRITE] = _tileMapData;
			_tile[TILE.Z] = 0;
			global.Map[# tx, ty] = _tile;
		}
	}

	// Other variables
	con_controller.render_done = true;
}