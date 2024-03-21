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
		if _tileMapData == 1 {
			var _mob = instance_create_layer(tileToRoomX(tx,ty),tileToRoomY(tx,ty),"Instances",obj_inkcap);
			global.Mobs[# tx,ty] = _mob;
		} else {
			global.Mobs[# tx,ty] = undefined;	
		}
		
	}
}

// Mouse util
selected = [-1,-1];
hover = [-1,-1];

// Other
turn = 0;




















