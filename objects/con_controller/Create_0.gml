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
		if _tileMapData == 0 {
			global.Mobs[# tx,ty] = undefined;
			
		} else {
			var _mob = instance_create_layer(tileToRoomX(tx,ty),tileToRoomY(tx,ty),"Instances",getObjectFromTilemap(_tileMapData));
			global.Mobs[# tx,ty] = _mob;
			with _mob {
				gx = tx;
				gy = ty;
			}
		}
		
	}
}

// Mouse util
selected = [-1,-1];
hover = [-1,-1];

// Other
turn = 0;
mode = 0; // 0 -> move	 1 -> attack



















