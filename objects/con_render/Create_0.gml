/// @description Render map

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




















