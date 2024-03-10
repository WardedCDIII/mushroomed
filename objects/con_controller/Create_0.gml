/// @description Create mob grid

layer_set_visible("Mobs",false);
// Create character grid global.Mobs
global.Mobs = ds_grid_create(MAP_W,MAP_H);
var _tileMap = layer_tilemap_get_id("Mobs");

// Populate global.Mobs
for(var tx=0; tx<MAP_W; tx++) {
	for(var ty=0; ty<MAP_H; ty++) {
		var _tileMapData = tilemap_get(_tileMap,tx,ty);
		_tileMapData = tile_get_index(_tileMapData);
		var _tile = [-1, 0];
		_tile[MOB.SPRITE] = _tileMapData;
		_tile[MOB.Z] = 0;
		global.Mobs[# tx, ty] = _tile;
	}
}

// Mouse util
selected = [-1,-1];
hover = [-1,-1];






















