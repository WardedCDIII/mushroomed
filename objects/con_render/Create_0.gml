/// @description Render map

total_action_points = 10; // The number of action points available at the start of the turn
remaining_action_points = 10; // The amount of points that can be used by the player during each turn
player_score = 0; // The score for the player
lost = false; // If the player has lost the game
won = false; // If the player has won the game

layer_set_visible("Map",false);

global.Map = ds_grid_create(MAP_W,MAP_H);
var _tileMap = layer_tilemap_get_id("Map")

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




















